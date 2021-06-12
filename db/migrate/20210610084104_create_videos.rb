class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :Title
      t.string :Game
      t.text :URL
      t.text :Image
      t.string :Time
      t.integer :Total
      t.string :Date

      t.timestamps
    end
  end
end
