class CreateOperation < ActiveRecord::Migration[8.0]
  def change
    create_table :operations do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.timestamp :took, null: false
      t.timestamp :returned

      #t.timestamps
    end
  end
end
