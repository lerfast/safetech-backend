class CreateSafetyMeetings < ActiveRecord::Migration[7.1]
  def change
    create_table :safety_meetings do |t|
      t.string :title
      t.text :agenda
      t.datetime :meeting_date
      t.text :follow_up_actions
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
