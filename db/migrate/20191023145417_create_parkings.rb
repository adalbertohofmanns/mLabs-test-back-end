class CreateParkings < ActiveRecord::Migration[5.2]
  def change
    create_table :parkings do |t|
      t.string :plate
      t.boolean :paid
      t.boolean :left
      t.datetime :time

      t.timestamps
    end
  end
end
