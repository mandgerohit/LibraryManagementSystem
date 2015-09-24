class AddCheckoutHistoryBooks < ActiveRecord::Migration
  def change
  add_column :books, :checkout_history, :string, array: true, default: '{}'
  end
end
