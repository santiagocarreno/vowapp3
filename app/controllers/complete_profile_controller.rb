class CompleteProfileController < ApplicationController

	def index
		@user = current_user	
	end

	def save
		@user = current_user
		if @user.update(params.require(:user).permit(:email))
			redirect_to complete_profile_path
		else
			render 'index'
		end
	end

end
