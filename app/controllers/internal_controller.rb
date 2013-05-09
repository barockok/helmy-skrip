class InternalController < ApplicationController
	before_filter :authenticate_user!
  # load_resource
  authorize_resource

	skip_load_resource :only => :index
	skip_authorize_resource :only => :index

  rescue_from CanCan::AccessDenied do |exception|
  	respond_to do |wants|
  		wants.html { redirect_to root_path, :alert => exception.message }
  	end
  end
	
	def index
	end

  def current_ability
    @current_ability ||= Ability.new(current_user || User.new)
  end	

end