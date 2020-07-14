class Category < ApplicationRecord
    has_many :articles


    validates :name, presence: true, uniqueness: true


    def latest_article
        articles.order(created_at: :desc)
    end
end
