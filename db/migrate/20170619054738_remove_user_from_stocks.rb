class RemoveUserFromStocks < ActiveRecord::Migration[5.0]
  def change
    remove_reference :stocks, :user, foreign_key: true
  end
end
