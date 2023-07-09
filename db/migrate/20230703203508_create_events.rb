class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :guests
      t.string :location
      t.datetime :starttime
      t.datetime :endtime
      t.string :tag

      t.timestamps
    end
  end
end
