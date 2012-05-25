class RenameOrganizationColumnsToMatchExcelFiles < ActiveRecord::Migration

  def up
    add_column    :organizations,  :ein,                              :integer,          :null => false, :default => 0
    add_index     :organizations,  :ein, :unique    => true
    add_column    :organizations,  :in_care_of_name,                  :string
    change_column :organizations,  :address,                          :string,           :null => false
    add_column    :organizations,  :city,                             :string,           :null => false, :default => ''
    add_column    :organizations,  :state,                            :string,           :null => false, :default => ''
    rename_column :organizations,  :zip, :zip_code
    change_column :organizations,  :zip_code,                         :string,           :null => false, :default => ''
    add_column    :organizations,  :group_exemption_number,           :integer
    add_column    :organizations,  :subsection_code,                  :integer
    add_column    :organizations,  :affiliation_code,                 :integer
    add_column    :organizations,  :classification_code,              :integer
    add_column    :organizations,  :ruling_date,                      :date
    add_column    :organizations,  :deductibility_code,               :integer
    add_column    :organizations,  :foundation_code,                  :integer
    add_column    :organizations,  :activity_code,                    :integer
    add_column    :organizations,  :organization_code,                :integer
    add_column    :organizations,  :exempt_organization_status_code,  :integer
    add_column    :organizations,  :advanced_ruling_expiration_date,  :date
    add_column    :organizations,  :tax_period,                       :integer
    add_column    :organizations,  :asset_code,                       :integer
    add_column    :organizations,  :income_code,                      :integer
    add_column    :organizations,  :filing_requirement_code,          :integer
    add_column    :organizations,  :pf_filing_requirement_code,       :integer
    add_column    :organizations,  :accounting_period,                :integer
    add_column    :organizations,  :asset_amount,                     :float
    add_column    :organizations,  :income_amount,                    :float
    add_column    :organizations,  :form_990_revenue_amount,          :float
    rename_column :organizations,  :ntee, :ntee_code
    add_column    :organizations,  :sort_or_secondary_name,           :string
  end

  def down
    remove_column :organizations,  :sort_or_secondary_name
    rename_column :organizations,  :ntee_code, :ntee
    remove_column :organizations,  :form_990_revenue_amount
    remove_column :organizations,  :income_amount
    remove_column :organizations,  :asset_amount
    remove_column :organizations,  :accounting_period
    remove_column :organizations,  :pf_filing_requirement_code
    remove_column :organizations,  :filing_requirement_code
    remove_column :organizations,  :income_code
    remove_column :organizations,  :asset_code
    remove_column :organizations,  :tax_period
    remove_column :organizations,  :advanced_ruling_expiration_date
    remove_column :organizations,  :exempt_organization_status_code
    remove_column :organizations,  :organization_code
    remove_column :organizations,  :activity_code
    remove_column :organizations,  :foundation_code
    remove_column :organizations,  :deductibility_code
    remove_column :organizations,  :ruling_date
    remove_column :organizations,  :classification_code
    remove_column :organizations,  :affiliation_code
    remove_column :organizations,  :subsection_code
    remove_column :organizations,  :group_exemption_number
    change_column :organizations,  :zip_code
    rename_column :organizations,  :zip_code, :zip
    remove_column :organizations,  :state
    remove_column :organizations,  :city
    change_column :organizations,  :address
    remove_column :organizations,  :in_care_of_name
    remove_index :organizations, :column => :ein
    remove_column :organizations,  :ein
  end
end
