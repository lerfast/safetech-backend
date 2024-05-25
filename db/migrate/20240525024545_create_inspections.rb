class CreateInspections < ActiveRecord::Migration[7.1]
  def change
    create_table :inspections do |t|
      t.date :inspection_date
      t.string :location
      t.integer :inspector_id
      t.integer :equipment_id
      t.string :status

      t.timestamps
    end
  end
end
