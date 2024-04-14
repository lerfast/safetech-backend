# db/migrate/[timestamp]_create_incidents.rb
class CreateIncidents < ActiveRecord::Migration[7.0]
  def change
    create_table :incidents do |t|
      t.date :date
      t.text :description
      t.string :severity
      t.references :incident_type, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
