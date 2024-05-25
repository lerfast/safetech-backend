class CreateSafetyDataSheets < ActiveRecord::Migration[7.1]
  def change
    create_table :safety_data_sheets do |t|
      t.string :title
      t.text :content
      t.integer :created_by

      t.timestamps
    end
  end
end
