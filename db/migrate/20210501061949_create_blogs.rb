class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.datetime :date
      t.text :content
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
