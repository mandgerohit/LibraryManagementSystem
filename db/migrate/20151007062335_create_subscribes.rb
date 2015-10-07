class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.string :book
      t.string :user
      t.timestamps null: false
    end
  end
end
