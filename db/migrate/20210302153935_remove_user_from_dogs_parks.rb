class RemoveUserFromDogsParks < ActiveRecord::Migration[6.1]
  def change
    remove_reference :dogs_parks, :user, null: false, foreign_key: true
  end
end
