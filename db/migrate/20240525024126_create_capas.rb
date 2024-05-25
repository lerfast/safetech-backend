class CreateCapas < ActiveRecord::Migration[7.1]
  def change
    create_table :capas do |t|
      t.text :action_description
      t.references :responsible_person, null: false, foreign_key: { to_table: :users }
      t.date :start_date
      t.date :end_date
      t.string :priority
      t.string :status
      t.references :incident, null: false, foreign_key: true

      t.timestamps
    end
  end
end
