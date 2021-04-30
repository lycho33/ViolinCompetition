class CreatePerformances < ActiveRecord::Migration[6.1]
  def change
    create_table :performances do |t|
      t.string :performer
      t.string :division
      t.string :round
      t.datetime :date
      t.string :piece
      t.string :video

      t.timestamps
    end
  end
end
