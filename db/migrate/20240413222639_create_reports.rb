class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.references :incident, null: false, foreign_key: true
      t.text :details

      t.timestamps
    end
  end
end
