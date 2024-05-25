class CreateHelps < ActiveRecord::Migration[7.1]
  def change
    create_table :helps do |t|
      t.string :title
      t.text :content
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
