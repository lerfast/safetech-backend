class CreateDashboards < ActiveRecord::Migration[7.1]
  def change
    create_table :dashboards do |t|
      t.string :title
      t.text :description
      t.json :data
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
