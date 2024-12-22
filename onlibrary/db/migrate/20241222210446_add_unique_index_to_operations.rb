class AddUniqueIndexToOperations < ActiveRecord::Migration[8.0]
  def change
    add_index :operations, [ :book, :user ], unique: true, where: "returned IS NULL", name: 'index_operations_on_book_and_user_where_returned_nil'
  end
end
