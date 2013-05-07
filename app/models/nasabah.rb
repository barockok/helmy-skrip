class Nasabah < ActiveRecord::Base
	GENDERS 			= %w{pria perempuan}
	ID_TYPES 			= %w{KTP SIM PASPOR}
	RELIGIONS 		= %w{islam kriten katolik hindu budha other}
	NATIONALITIES = ['indonesia', 'united state', 'singapore', 'malaysia', 'australia', 'united kingdom']

	has_many :transactions
	belongs_to :product

	validates_presence_of :nama_lengkap, :product_id 


	def account_number
		num =  "%010d" % self.id
		num.split(//).each_slice(3).to_a.map{|r| r.join('')}.join('-')
	end
	def saldo
		transactions.sum(:credit)
	end
	def approved?
		true
	end
	def completeness_product
		@completeness_product ||= {
			:percent => '%.2f' % ((product_credit_counter*100).to_f/product.months_period.to_f) , 
			:left => product.months_period - product_credit_counter }
	end
	def product_credit_counter
		@product_credit_counter ||= transactions.where(:product_id => self.product_id).count
	end
end
