class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :Name
      t.string :NTEE
      t.string :ZipCode

      t.timestamps
    end
  end
end
