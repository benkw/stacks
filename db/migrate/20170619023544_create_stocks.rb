class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :name
      t.references :stack, foreign_key: true

      t.timestamps
    end
  end
end
