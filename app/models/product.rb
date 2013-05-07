class Product < ActiveRecord::Base
	validates :name, :code, :presence => true

	def transaction_context trx, state = :credit
		counter = trx.nasabah.transactions.where(:product_id => self.id).count
		month =  trx.nasabah.created_at.to_time+counter.month
		"Setoran ##{counter+1} #{self.name} V.#{self.version} - #{month.strftime('%B %Y')}"
	end

	def name_version
		"#{read_attribute(:name)} V.#{read_attribute(:version)}"
	end

	def self.collection_selects
		Product.order(:version).uniq(:code).map{|p| ["#{p.name} v.#{p.version}", p.id]}
	end
end
