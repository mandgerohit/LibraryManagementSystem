class CreateSuggestedBooks < ActiveRecord::Migration
  def change
    create_table :suggested_books do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :description
      t.string :suggested_by
      t.timestamps null: false
    end
  end
end
