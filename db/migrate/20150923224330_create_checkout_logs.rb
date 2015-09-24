class CreateCheckoutLogs < ActiveRecord::Migration
  def change
    create_table :checkout_logs do |t|
      t.string :book
      t.string :user

      t.timestamps null: false
    end
  end
end
