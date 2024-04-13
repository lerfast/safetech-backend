class CreateTrainings < ActiveRecord::Migration[7.1]
  def change
    create_table :trainings do |t|
      t.date :date
      t.string :topic
      t.string :instructor
      t.integer :effectiveness

      t.timestamps
    end
  end
end
