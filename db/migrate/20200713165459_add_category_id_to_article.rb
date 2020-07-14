class AddCategoryIdToArticle < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :category, index: true, foreign_key: true
  end
end
