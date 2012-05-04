class CreateCommonCodes < ActiveRecord::Migration
  def change
    create_table :common_codes do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
