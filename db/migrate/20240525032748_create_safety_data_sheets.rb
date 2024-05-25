class CreateSafetyDataSheets < ActiveRecord::Migration[7.1]
  def change
    create_table :safety_data_sheets do |t|
      t.string :title
      t.text :content
      t.string :document_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
