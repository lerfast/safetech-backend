class CreateWorkObservations < ActiveRecord::Migration[7.1]
  def change
    create_table :work_observations do |t|
      t.text :description
      t.datetime :observed_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
