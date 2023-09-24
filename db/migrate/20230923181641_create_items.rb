class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :cart, null: false, foreign_key: true
      
      t.references :product_id, null: false, foreign_key: true

      t.integer :quantity

      t.timestamps
    end
  end
end
