class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :email
      t.integer :player_1
      t.integer :player_2
      t.integer :number_of_set

      t.timestamps null: false
    end
  end
end
