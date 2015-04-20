class CreateOutPutSolutions < ActiveRecord::Migration
  def change
    create_table :out_put_solutions do |t|
      t.string :monday
      t.string :tuesday
      t.string :wenesday
      t.string :thursday
      t.string :friday

      t.timestamps
    end
  end
end
