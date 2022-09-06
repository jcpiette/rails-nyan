class CreateNotifcations < ActiveRecord::Migration[7.0]
  def change
    create_table :notifcations do |t|
      t.string :message
      t.boolean :is_read
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
