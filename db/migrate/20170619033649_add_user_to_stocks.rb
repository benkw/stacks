class AddUserToStocks < ActiveRecord::Migration[5.0]
  def change
    add_reference :stocks, :user, foreign_key: true
  end
end
