class CreateLendBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :lend_books do |t|
      t.integer :days, null: false
      t.integer :status, null: false, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
