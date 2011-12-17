class UsersController < ApplicationController
  def show
  	@user = User.find_by_id(params[:id])
	@correct_user = ( current_user.id == @user.id ) if user_signed_in?
	if @correct_user
		@picture = current_user.pictures.new

	end
  end

  def index
  end

end
