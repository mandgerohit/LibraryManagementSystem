class AddBookTakenUsers < ActiveRecord::Migration
  def change
  add_column :users, :book_taken, :boolean, default: false
  end
end
