class AddDiscardedAtToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :discarded_at, :datetime
    add_index :orders, :discarded_at
  end
end

# TODO このファイルを消してrails db:migrate:resetするかも rails db:seedしてorderにformからデータを入れなおす。
