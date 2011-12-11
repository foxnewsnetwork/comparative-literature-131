class PicturesController < ApplicationController
	
	def create
		@pic = current_user.pictures.build(params[:picture])
		if @pic.save
			flash[:success] = "Picture upload successful!"
			redirect_to current_user
		else
			flash[:error] = "Failed to upload picture"
			redirect_to root_path	
		end
	end
	
end
