class AddViewedParkToDogs < ActiveRecord::Migration[6.1]
  def change
    add_reference :dogs, :viewed_park, null: true, foreign_key: { to_table: :parks }
  end
end
