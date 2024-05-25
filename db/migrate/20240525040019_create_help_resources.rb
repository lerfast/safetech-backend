class CreateHelpResources < ActiveRecord::Migration[7.1]
  def change
    create_table :help_resources do |t|
      t.string :title
      t.text :content
      t.string :help_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
