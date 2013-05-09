class AdministrationFeesController < InternalController
	def index
    @administration_fees = AdministrationFee.filterize(filter_params).paginate(paginate_options) 
	end

end