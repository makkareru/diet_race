class AddTypeToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :type, :integer, default: 0
  end
end
