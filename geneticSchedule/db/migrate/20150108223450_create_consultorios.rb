class CreateConsultorios < ActiveRecord::Migration
  def change
    create_table :consultorios do |t|
      t.string :numero
      t.string :nombre

      t.timestamps
    end
  end
end
