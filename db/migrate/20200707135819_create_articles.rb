class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :text
      t.string :image
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
