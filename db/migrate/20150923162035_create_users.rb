class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.boolean :admin
      t.boolean :member
      t.string :checkout_history

      t.timestamps null: false
    end
  end
end
