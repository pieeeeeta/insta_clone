class HomeController < ApplicationController
  def top 
    if user_signed_in?
      @pictureposts = current_user.feed
      @comment = Comment.new
    end
  end
end
