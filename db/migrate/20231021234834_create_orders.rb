class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :address, null: false
      t.string :address_2, null: false
      t.string :county, null: false
      t.string :prefecture, null: false
      t.string :credit_card_number, null: false
      t.string :credit_card_expiration, null: false
      t.string :credit_card_cvv, null: false
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
