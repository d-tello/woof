class AddAddressToDogsParks < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs_parks, :address, :string
  end
end
