class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @pictureposts = current_user.pictureposts
  end
end
