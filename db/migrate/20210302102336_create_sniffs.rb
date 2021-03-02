class CreateSniffs < ActiveRecord::Migration[6.1]
  def change
    create_table :sniffs do |t|
      t.references :sniffer, foreign_key: { to_table: :dogs }
      t.references :sniffed, foreign_key: { to_table: :dogs }

      t.boolean :status, default: nil

      t.timestamps
    end
  end
end
