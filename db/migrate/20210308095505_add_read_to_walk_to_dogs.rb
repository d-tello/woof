class AddReadToWalkToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :ready_to_walk, :boolean
  end
end
