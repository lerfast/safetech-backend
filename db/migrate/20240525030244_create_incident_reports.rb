class CreateIncidentReports < ActiveRecord::Migration[7.1]
  def change
    create_table :incident_reports do |t|
      t.text :consequences
      t.text :event_details
      t.text :personal_injuries
      t.text :asset_damage
      t.string :event_severity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
