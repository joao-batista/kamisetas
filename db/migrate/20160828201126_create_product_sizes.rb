class CreateProductSizes < ActiveRecord::Migration
  def change
    create_table :product_sizes do |t|
      t.references :product, index: true, foreign_key: true
      t.references :size, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
