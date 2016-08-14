class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :request_date
      t.date :disptch_date
      t.date :delivery_date
      t.decimal :freight
      t.references :user, index: true, foreign_key: true
      t.references :status_order, index: true, foreign_key: true
      t.references :payment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
