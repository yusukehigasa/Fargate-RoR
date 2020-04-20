class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :status, default: 0
      t.datetime :released_at, precision: 6 , null: false
      t.datetime :deleted_at, precision: 6

      t.timestamps
    end
  end
end
