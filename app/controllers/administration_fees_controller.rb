class AdministrationFeesController < InternalController
	def index
		respond_to do |format|
	    format.html{@administration_fees = AdministrationFee.filterize(filter_params).latest.paginate(paginate_options)}
      format.csv do
      	@administration_fees = AdministrationFee.filterize(filter_params).latest
      	response.headers['Content-Disposition'] = 'attachment; filename="' + "Administration Fee #{filter_params[:from].to_date.strftime("%-d %B, %Y")} - #{filter_params[:to].to_date.strftime("%-d %B, %Y")} #{Time.now.to_i}" + '.csv"'
      end
		end	    
	end

end