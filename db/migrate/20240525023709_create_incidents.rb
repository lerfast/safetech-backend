class CreateIncidents < ActiveRecord::Migration[7.1]
  def change
    create_table :incidents do |t|
      t.text :description
      t.date :incident_date
      t.date :reported_date
      t.string :location
      t.references :user, null: false, foreign_key: true
      t.string :severity
      t.string :status

      t.timestamps
    end
  end
end
