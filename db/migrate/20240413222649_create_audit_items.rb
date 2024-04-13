class CreateAuditItems < ActiveRecord::Migration[7.1]
  def change
    create_table :audit_items do |t|
      t.references :audit, null: false, foreign_key: true
      t.text :description
      t.string :compliance_status

      t.timestamps
    end
  end
end
