class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :price, :precision => 16, :scale => 2
      t.datetime :purchased_at
      t.boolean :shipping

      t.timestamps
    end
  end
end
