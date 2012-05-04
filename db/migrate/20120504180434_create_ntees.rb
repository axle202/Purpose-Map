class CreateNtees < ActiveRecord::Migration
  def change
    create_table :ntees do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
