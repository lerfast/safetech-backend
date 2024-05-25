class CreateCompleteAudits < ActiveRecord::Migration[7.1]
  def change
    create_table :complete_audits do |t|
      t.text :scope
      t.text :specific_questions
      t.text :audit_details
      t.text :corrective_actions
      t.string :audit_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
