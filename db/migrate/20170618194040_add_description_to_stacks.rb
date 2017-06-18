class AddDescriptionToStacks < ActiveRecord::Migration[5.0]
  def change
    add_column :stacks, :description, :string
  end
end
