class CreateAudits < ActiveRecord::Migration[7.1]
  def change
    create_table :audits do |t|
      t.date :date
      t.text :details
      t.string :auditor

      t.timestamps
    end
  end
end
