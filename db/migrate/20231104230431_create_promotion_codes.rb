class CreatePromotionCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :promotion_codes do |t|
      t.string :code, unique: true
      t.integer :discount_amount
      t.boolean :used, default: false
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
