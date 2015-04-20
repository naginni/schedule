class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :cc
      t.string :nombre
      t.string :apellido
      t.string :perfil
      t.string :telefono
      t.string :direccion
      t.string :especialidad
      t.string :password_hash
      t.string :password_salt
      t.string :email

      t.timestamps
    end
  end
end
