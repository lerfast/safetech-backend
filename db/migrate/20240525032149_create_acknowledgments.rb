class CreateAcknowledgments < ActiveRecord::Migration[7.1]
  def change
    create_table :acknowledgments do |t|
      t.string :title
      t.text :description
      t.date :date_awarded
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
