class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :isbn
      t.text :cover
      t.decimal :price
      t.integer :category_id
      t.integer :author_id

      t.timestamps
    end
  end
end
