class CreateStatusOrders < ActiveRecord::Migration
  def change
    create_table :status_orders do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
