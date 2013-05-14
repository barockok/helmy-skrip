class ReportsController <InternalController
	skip_load_and_authorize_resource

	def index
		@transactions = Transaction.rickshaw(filter_params)
		@nasabahs = Nasabah.rickshaw(filter_params)
		@administration_fees = AdministrationFee.rickshaw(filter_params)
	end



end