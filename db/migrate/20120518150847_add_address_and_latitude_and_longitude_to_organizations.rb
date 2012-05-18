class AddAddressAndLatitudeAndLongitudeToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :address, :string
    add_column :organizations, :latitude, :float
    add_column :organizations, :longitude, :float
    rename_column :organizations, 'Name', :name
    rename_column :organizations, 'NTEE', :ntee
    rename_column :organizations, 'ZipCode', :zip
  end
end
