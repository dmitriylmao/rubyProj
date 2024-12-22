class CreateOperation < ActiveRecord::Migration[8.0]
  def change
    create_table :operations do |t|
      t.bigint :user, null: false
      t.bigint :book, null: false
      t.timestamp :took, null: false
      t.timestamp :returned

      #t.timestamps
    end
  end
end
