class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :value
      t.references :status_payment, index: true, foreign_key: true
      t.references :kind_payment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
