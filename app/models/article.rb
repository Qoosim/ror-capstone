class Article < ApplicationRecord
  acts_as_votable
  belongs_to :user
  belongs_to :category
  
  validates :title, :text, :image, :user_id, :category_id, presence: true

  mount_uploader :image, ImageUploader
end
