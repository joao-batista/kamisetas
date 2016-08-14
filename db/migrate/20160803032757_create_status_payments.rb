class CreateStatusPayments < ActiveRecord::Migration
  def change
    create_table :status_payments do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
