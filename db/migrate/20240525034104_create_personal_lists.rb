class CreatePersonalLists < ActiveRecord::Migration[7.1]
  def change
    create_table :personal_lists do |t|
      t.string :title
      t.json :items
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
