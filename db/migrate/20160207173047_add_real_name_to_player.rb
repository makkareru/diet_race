class AddRealNameToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :real_name, :string
  end
end
