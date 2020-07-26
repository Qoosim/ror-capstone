class Category < ApplicationRecord
  has_many :articles

  validates :name, :priority, presence: true, uniqueness: true

  scope :cate_priority, -> { order('priority desc') }

  scope :cate_priority, -> { order('priority desc') }

  scope :all_articles, ->(category_id) { where(id: category_id).includes(:articles) }

  def latest_article
    articles.order(created_at: :desc)
  end

  def latest_article
    articles.order(created_at: :desc)
  end
end
