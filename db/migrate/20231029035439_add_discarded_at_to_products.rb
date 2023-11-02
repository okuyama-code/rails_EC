# frozen_string_literal: true

class AddDiscardedAtToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :discarded_at, :datetime
    add_index :products, :discarded_at
  end
end
