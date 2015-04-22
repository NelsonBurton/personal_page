class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :age
      t.decimal :height
      t.decimal :weight
      t.decimal :bodyfat

      t.timestamps null: false
    end
  end
end
