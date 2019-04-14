module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Insta App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  #与えられたユーザーがログイン中のユーザーかどうかを判定する
  def current_user?(user)
    user == current_user
  end
end
