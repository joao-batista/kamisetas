class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
