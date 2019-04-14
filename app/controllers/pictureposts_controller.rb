class PicturepostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :delete]
  before_action :correct_user, only: :destroy

  def show
    @picturepost = Picturepost.find(params[:id])
    @comments = @picturepost.comments
    @comment = Comment.new
  end

  def new
    @picturepost = Picturepost.new
  end

  def create
    @picturepost = Picturepost.new(content: picturepost_params[:content], picture: picturepost_params[:picture], user_id: current_user.id)
    @picturepost.save
    redirect_to root_url
  end

  def destroy
    @picturepost.destroy
    redirect_to user_path(@picturepost.user)
  end

  private

  def picturepost_params
    params.require(:picturepost).permit(:content, :picture)
  end

  def correct_user
    @picturepost = current_user.pictureposts.find_by(id: params[:id])
    redirect_to root_url if @picturepost.nil?
  end
end