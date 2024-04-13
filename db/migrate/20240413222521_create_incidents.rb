class CreateIncidents < ActiveRecord::Migration[7.1]
  def change
    create_table :incidents do |t|
      t.date :date
      t.text :description
      t.string :severity

      t.timestamps
    end
  end
end
