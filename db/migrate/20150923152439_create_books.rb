class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :description
      t.boolean :status
      t.string :taken_by
      t.timestamps null: false
    end
  end
end
