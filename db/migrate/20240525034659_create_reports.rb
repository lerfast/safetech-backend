class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :content
      t.string :report_type
      t.integer :generated_by

      t.timestamps
    end
  end
end
