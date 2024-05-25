class CreateQrScans < ActiveRecord::Migration[7.1]
  def change
    create_table :qr_scans do |t|
      t.string :data
      t.datetime :scanned_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
