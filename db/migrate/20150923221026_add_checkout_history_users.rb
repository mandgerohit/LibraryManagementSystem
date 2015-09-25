class AddCheckoutHistoryUsers < ActiveRecord::Migration
  def change
  add_column :users, :checkout_history, :string, array: true, default: '{}'
  end
end
