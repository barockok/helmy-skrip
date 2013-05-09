class Transaction < ActiveRecord::Base
	belongs_to :product
	belongs_to :nasabah
	validates_associated :product, :nasabah	

	validates_presence_of :nasabah_id
	validates_presence_of :product_id , :if => 'nasabah and nasabah.approved?'
	validates_presence_of :credit, :debit, :description , :if => 'product'

	validate :validate_credit_amount_by_product, :if => 'product and nasabah'
	validate :validate_nasabah_approval, :unless => 'nasabah.blank?'


	after_initialize :define_stuff_by_product, :on => :create, :if => 'new_record?'
	after_create :create_multiple_item

	def validate_nasabah_approval
		errors.add(:nasabah_id, 'Pengajuan aplikasi belum disetujui') unless nasabah.approved?
	end
	
	def validate_credit_amount_by_product
		#check product finish months_period already
		completeness = nasabah.transactions.where(:product_id => self.product_id).count == product.months_period
		if completeness
			errors.add(:user_id, "already completed product months period")
		else
			errors.add(:credit, "amount must be greater than #{product.month_credit} or it's multiple ") if \
			self.credit < product.month_credit or (self.credit%product.month_credit) > 0
		end
	end

	def create_multiple_item
		((@holder_attr['credit'].to_i/product.month_credit)-1).times do ||
			Transaction.create(:nasabah_id => self.nasabah_id, :debit =>self.debit, :credit => product.month_credit, :product_id => self.product_id)
		end
		true
	end
	def nasabah_id=(number)
		write_attribute(:nasabah_id, number.to_s.gsub('/\D/', '').to_i)
	end
	def define_stuff_by_product

		@holder_attr = self.as_json(:root => false)
		# build dependency
		self.nasabah = Nasabah.find_by_id(self.nasabah_id)
		self.product = Product.find_by_id(self.nasabah.product_id) if self.nasabah
		self.description = ''; self.credit = ''

		self.description = product.transaction_context(self) if self.product and self.nasabah
		self.product_id = product.id if self.product
		self.credit = product.month_credit if self.product
	end


end
