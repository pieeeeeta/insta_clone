class LikesController < ApplicationController
  before_action :set_valiables

  def like
    like = current_user.likes.new(picturepost_id: @picturepost.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(picturepost_id: @picturepost.id)
    like.destroy
  end

  private

  def set_valiables
    @picturepost = Picturepost.find(params[:picturepost_id])
    @id_name = "#like-link-#{@picturepost.id}"
  end
end