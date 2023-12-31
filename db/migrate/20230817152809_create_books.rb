class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :bookname
      t.string :author
      t.integer :price
      t.integer :quantity
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
