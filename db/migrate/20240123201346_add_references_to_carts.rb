class AddReferencesToCarts < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :promotion_code, null: true, foreign_key: true
  end
end
