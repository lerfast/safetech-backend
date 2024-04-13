class CreateIncidentTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :incident_types do |t|
      t.string :type_name
      t.text :description

      t.timestamps
    end
  end
end
