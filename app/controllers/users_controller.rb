class UsersController < ApplicationController
  def show
  	if user_signed_in?
  		@is_correct_user = ( current_user.id.to_s == params[:id] )
  		@picture = Picture.new
  		@existing_pics = current_user.pictures
  	else
  		@is_correct_user = false
  	end
  end

  def index
  end

end
