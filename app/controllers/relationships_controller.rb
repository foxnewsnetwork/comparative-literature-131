class RelationshipsController < ApplicationController
  before_filter :authenticate
  
  def create
  	@user = User.find_by_id(params[:relationships][:followed_id])
  	current_user.follow!(@user)
  	redirect_to @user
  end

  def destroy
	@user = Relationship.find(params[:id]).followed
	current_user.unfollow!(@user)
	redirect_to @user
  end

end
