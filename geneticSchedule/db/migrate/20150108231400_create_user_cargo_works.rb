class CreateUserCargoWorks < ActiveRecord::Migration
  def change
    create_table :user_cargo_works do |t|
      t.integer :user_id
      t.integer :cargo_id
      t.integer :estado
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday

      t.timestamps
    end
  end
end
