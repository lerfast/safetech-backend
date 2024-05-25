class CreateQrScans < ActiveRecord::Migration[7.1]
  def change
    create_table :qr_scans do |t|
      t.text :scanned_data
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
