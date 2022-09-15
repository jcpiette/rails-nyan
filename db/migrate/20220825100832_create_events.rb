class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :location
      t.datetime :event_date
      t.references :user, null: false, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.string :google_img

      t.timestamps
    end
  end
end
