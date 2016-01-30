class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.float :weight
      t.text :profile
      t.integer :ranking

      t.timestamps null: false
    end
  end
end
