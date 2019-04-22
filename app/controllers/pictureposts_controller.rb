class PicturepostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :delete]
  before_action :correct_user, only: :destroy

  def index
    @pictureposts = Picturepost.all.order('created_at DESC')
  end

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
    if @picturepost.save
      flash[:success] = '写真を投稿しました！'
      redirect_to picturepost_url(@picturepost)
    else
      render 'new'
    end
  end

  def destroy
    @picturepost.destroy
    flash[:danger] = '写真を削除しました！'
    redirect_to user_path(@picturepost.user)
  end

  def search
    @pictureposts = Picturepost.where('content LIKE ?', "%#{params[:search]}%")
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