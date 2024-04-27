# db/migrate/[timestamp]_add_type_to_trainings.rb
class AddTypeToTrainings < ActiveRecord::Migration[7.1]
  def change
    add_column :trainings, :training_type, :string
  end
end
