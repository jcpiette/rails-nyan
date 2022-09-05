class CreateEventMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :event_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.boolean :is_interested, null: false, default: false

      t.timestamps
    end
  end
end