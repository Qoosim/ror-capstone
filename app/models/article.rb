class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :votes, dependent: :destroy
  validates :title, :text, :image, :user_id, :category_id, presence: true

  mount_uploader :image, ImageUploader

 

end
