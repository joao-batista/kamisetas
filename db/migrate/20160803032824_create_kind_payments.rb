class CreateKindPayments < ActiveRecord::Migration
  def change
    create_table :kind_payments do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
