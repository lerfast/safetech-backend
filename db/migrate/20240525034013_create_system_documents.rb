class CreateSystemDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :system_documents do |t|
      t.string :title
      t.text :content
      t.string :document_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
