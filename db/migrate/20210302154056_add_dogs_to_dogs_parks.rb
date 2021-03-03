class AddDogsToDogsParks < ActiveRecord::Migration[6.1]
  def change
    add_reference :dogs_parks, :dog, null: false, foreign_key: true
  end
end
