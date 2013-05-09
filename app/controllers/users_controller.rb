class	UsersController < InternalController
  before_filter only: [:show, :edit, :update, :destroy] do
  		@user = User.find(params[:id])  	
	end
	before_filter :only => [:edit_profile, :profile, :update_profile, :edit_password, :update_password] do
		@user = current_user
	end


	def edit_profile
	end

	def index
		@users = User.all
	end

	def profile
		render :action => :show
	end
	
	def update_profile
		if @user.update_attributes(profile_params)
			redirect_to profile_path, :notice => "Success Update Profile"
		else
			flash[:alert] = @user.errors.to_a.join(", ")
			render :action => :edit_profile
		end
	end
	
	def edit_password
	end

	def update_password
		if @user.update_with_password(profile_params)
			redirect_to profile_path, :notice => "Success Ubah Password"
		else
			flash[:alert] = @user.errors.to_a.join(", ")
			render :action => :edit_password
		end
	end	

	def new
		@user = User.new
	end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @nasabah }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end	

	def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

	end
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
	def user_params
		params.require(:user).permit({:roles => []}, :password, :password_confirmation,:email, :name  )		
	end
	def profile_params
		params.require(:user).permit(:email, :name, :password, :password_confirmation , :current_password)				
	end
end