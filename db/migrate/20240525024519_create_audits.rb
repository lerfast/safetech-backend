class CreateAudits < ActiveRecord::Migration[7.1]
  def change
    create_table :audits do |t|
      t.date :audit_date
      t.string :location
      t.integer :auditor_id
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
