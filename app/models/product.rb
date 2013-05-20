class Product < ActiveRecord::Base
	validates :name, :code, :month_credit, :months_period, :presence => true
	validates :code, :uniqueness => {:scope => :version, :message => 'maybe you want to create other version, is it?'}

	after_initialize :assign_version, :on => :create, :if => 'new_record? and code.blank? == false'
	before_validation :assign_first_credit
	before_destroy :check_nasabah_existence
	has_many :nasabahs
	has_many :other_versions, :class_name => 'Product', :foreign_key => 'code' , :primary_key => 'code'
	def assign_first_credit
		self.first_credit = self.month_credit
	end
	def assign_version
		current_ver = Product.where(:code => self.code).count
		self.version = current_ver+1
	end

	def clone_attr_for_upgrade
		as_json(:only => [:code, :name])
	end
	def check_nasabah_existence
		if (counter = Nasabah.where(:product_id => self.id).count) > 0
			errors.add(:base, "masih ada #{counter} nasabah yang terdaftar dengan product #{self.name_version}") 
			return false
		end
		true
	end

	def transaction_context trx, state = :credit
		counter = trx.nasabah.transactions.where(:product_id => self.id).count
		month =  trx.nasabah.created_at.to_time+counter.month
		"Setoran ##{counter+1} #{self.name} V.#{self.version} - #{month.strftime('%B %Y')}"
	end

	def name_version
		"#{read_attribute(:name)} V.#{read_attribute(:version)}"
	end

	def self.collection_selects
		Product.select(:code).uniq.map do |p|
			pr = Product.where(:code => p.code).order('version desc').limit(1).first
			["#{pr.name} v.#{pr.version}", pr.id]
		end
	end
end
