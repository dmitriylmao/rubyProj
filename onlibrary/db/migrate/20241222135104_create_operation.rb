class CreateOperation < ActiveRecord::Migration[8.0]
  def change
    create_table :operations do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.timestamp :took, null: false
      t.timestamp :returned

      #t.timestamps
    end
  end
end
