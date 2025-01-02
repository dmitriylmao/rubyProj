class RemoveIndexFromOperations < ActiveRecord::Migration[8.0]
  def change
    remove_index :operations, name: 'index_operations_on_book_and_user', if_exists: true
  end
end