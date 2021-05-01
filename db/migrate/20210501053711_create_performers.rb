class CreatePerformers < ActiveRecord::Migration[6.1]
  def change
    create_table :performers do |t|
      t.integer :age
      t.string :country
      t.text :bio
      t.belongs_to :performance

      t.timestamps
    end
  end
end
