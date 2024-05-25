class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.string :message
      t.references :user, null: false, foreign_key: true
      t.boolean :read_status

      t.timestamps
    end
  end
end
