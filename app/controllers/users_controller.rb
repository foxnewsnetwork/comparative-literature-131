class UsersController < ApplicationController
  def show
  	@user = User.find_by_id(params[:id])
	@correct_user = ( current_user.id == @user.id ) if user_signed_in?
	if @correct_user
		@picture = current_user.pictures.new
	end
  end

  def index
  # IMPLEMENT ME!!
  end
  
  def following
  	@title = "Following"
  	@user = User.find(params[:id])
  	@users = @user.following.paginate(:page => params[:page])
  	@correct_user = user_signed_in? ? current_user.id == @user.id : false
  	render "show_follow"
  end
  
  def followers
  	@title = "Followers"
  	@user = User.find(params[:id])
  	@users = @user.followers.paginate(:page => params[:page])
  	@correct_user = user_signed_in? ? current_user.id == @user.id : false
  	render "show_follow"
  end
  
  def stalking
  	@title = "Stalking"
  	@user = User.find(params[:id])
  	@users = @user.stalking.paginate(:page => params[:page])
  	@correct_user = user_signed_in? ? current_user.id == @user.id : false
  	render "show_stalk"
  end
  
  def stalkers
  	@title = "Stalkers"
  	@user = User.find(params[:id])
  	@users = @user.stalkers.paginate(:page => params[:page])
  	@correct_user = user_signed_in? ? current_user.id == @user.id : false  	
  	render "show_stalk"  	
  end

end
