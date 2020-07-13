class Article < ApplicationRecord
  acts_as_votable
  belongs_to :user
  
  validates :title, :text, :image, :user_id, presence: true

  mount_uploader :image, ImageUploader
end
