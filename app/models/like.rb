class Like < ApplicationRecord
  belongs_to :picturepost, counter_cache: :likes_count
  belongs_to :user
end
