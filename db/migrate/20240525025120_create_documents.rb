class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :content
      t.string :document_type
      t.integer :created_by

      t.timestamps
    end
  end
end
