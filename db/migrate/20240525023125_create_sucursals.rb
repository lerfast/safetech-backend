class CreateSucursals < ActiveRecord::Migration[7.1]
  def change
    create_table :sucursals do |t|
      t.string :name
      t.string :code
      t.string :address

      t.timestamps
    end
  end
end
