class CreateDogsParks < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs_parks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :park, null: false, foreign_key: true

      t.timestamps
    end
  end
end
