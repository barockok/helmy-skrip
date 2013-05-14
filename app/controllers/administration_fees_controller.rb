class AdministrationFeesController < InternalController
	def index
    @administration_fees = AdministrationFee.filterize(filter_params).latest.paginate(paginate_options) 
	end

end