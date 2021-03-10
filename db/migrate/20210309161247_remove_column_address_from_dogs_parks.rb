class RemoveColumnAddressFromDogsParks < ActiveRecord::Migration[6.1]
  def change
    remove_column :dogs_parks, :address, :string
  end
end
