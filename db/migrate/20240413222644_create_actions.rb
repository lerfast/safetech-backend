class CreateActions < ActiveRecord::Migration[7.1]
  def change
    create_table :actions do |t|
      t.references :incident, null: false, foreign_key: true
      t.text :action_taken
      t.datetime :date_action_taken

      t.timestamps
    end
  end
end
