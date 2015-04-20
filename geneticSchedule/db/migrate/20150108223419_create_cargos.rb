class CreateCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.string :cups
      t.string :nombre

      t.timestamps
    end
  end
end
