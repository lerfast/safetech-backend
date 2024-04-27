# db/migrate/[timestamp]_create_training_participations.rb
class CreateTrainingParticipations < ActiveRecord::Migration[7.1]
  def change
    create_table :training_participations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :training, null: false, foreign_key: true

      t.timestamps
    end
  end
end
