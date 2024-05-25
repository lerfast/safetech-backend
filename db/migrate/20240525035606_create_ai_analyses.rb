class CreateAiAnalyses < ActiveRecord::Migration[7.1]
  def change
    create_table :ai_analyses do |t|
      t.string :title
      t.text :description
      t.json :input_data
      t.json :output_data
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
