class Nasabah < ActiveRecord::Base
	GENDERS 			= %w{pria perempuan}
	ID_TYPES 			= %w{KTP SIM PASPOR}
	RELIGIONS 		= %w{islam kriten katolik hindu budha other}
	NATIONALITIES = ['indonesia', 'united state', 'singapore', 'malaysia', 'australia', 'united kingdom']

	has_many :transactions
	belongs_to :product

	validates_presence_of :nama_lengkap, :product_id 
	after_create :add_admin_fee
	around_update :check_approval
	act_as_date_filter
	act_as_group_by_date
	def add_admin_fee
		AdministrationFee.create(:description => "Biaya Applikasi Nasabah baru No.rek #{self.account_number}", :amount => 50000)
	end
	def check_approval
		before = Nasabah.find(self.id).approved?
		yield
		after = Nasabah.find(self.id).approved?
		if before == false and after == true
			after_approve
		end
	end
	
	def after_approve
		add_first_product_credit
	end

	def add_first_product_credit
		Transaction.create(:nasabah_id => self.id, :credit => self.product.month_credit)
	end
	
	def account_number
		num =  "%010d" % self.id
		num.split(//).each_slice(3).to_a.map{|r| r.join('')}.join('-')
	end
	def saldo
		transactions.sum(:credit)
	end
	def reviewed?
		['yes', 'no'].include?(self.approved)
	end
	def unreviewed?
		reviewed? == false
	end
	def approved?
		self.approved == 'yes'
	end

	def completeness_product
		@completeness_product ||= {
			:percent => '%.2f' % ((product_credit_counter*100).to_f/product.months_period.to_f) , 
			:left => product.months_period - product_credit_counter }
	end
	def product_credit_counter
		@product_credit_counter ||= transactions.where(:product_id => self.product_id).count
	end
	def self.rickshaw(params)
		q = Nasabah
			.filterize(params)
			.group_by_date.count
		res = []
		q.each{|k, v|
			res << {:x => k.to_time(:local).to_js_timestamp, :y => v}
		}
		res.sort_by {|k| k[:x] }
	end
end
