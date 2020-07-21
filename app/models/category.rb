class Category < ApplicationRecord
  has_many :articles

  validates :name, :priority, presence: true, uniqueness: true

  scope :cate_priority, -> { order('priority desc') }

  # scope :latest_article, -> { order('created_at desc') }

  def latest_article
    articles.order(created_at: :desc)
  end
end
