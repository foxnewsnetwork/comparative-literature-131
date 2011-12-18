class ObsessionsController < ApplicationController
  before_filter :authenticate
  
  def create
  	@user = User.find_by_id(params[:obsessions][:followed_id])
  	current_user.stalk!(@user)
  	redirect_to @user
  end

  def destroy
	@user = Obsession.find(params[:id]).followed
	current_user.unstalk!(@user)
	redirect_to @user
  end

end
