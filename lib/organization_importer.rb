require 'importex'

class OrganizationImporter < Importex::Base
  column "E. I. N.",                        :required => true,  :type   => Integer
  column "Name",                            :required => true
  column "In Care of Name",                 :required => false
  column "Address",                         :required => true
  column "City",                            :required => true
  column "State",                           :required => true
  column "Zip Code",                        :required => true,  :format => /\d{5}(?:-\d{4})/
  column "Group Exemption Number",          :required => true,  :type   => Integer
  column "Subsection Code",                 :required => true,  :type   => Integer
  column "Affiliation Code",                :required => true,  :type   => Integer
  column "Classification Code",             :required => true,  :type   => Integer
  column "Ruling Date",                     :required => true
  column "Deductibility Code",              :required => true,  :type   => Integer
  column "Foundation Code",                 :required => true,  :type   => Integer
  column "Activity Code",                   :required => true,  :type   => Integer
  column "Organization Code",               :required => true,  :type   => Integer
  column "Exempt Organization Status Code", :required => true,  :type   => Integer
  column "Advanced Ruling Expiration Date", :required => true
  column "Tax Period",                      :required => false
  column "Asset Code",                      :required => true,  :type   => Integer
  column "Income Code",                     :required => true,  :type   => Integer
  column "Filing Requirement Code",         :required => true,  :type   => Integer
  column "PF Filing Requirement Code",      :required => true,  :type   => Integer
  column "Blank",                           :required => false
  column "Accounting Period",               :required => true,  :type   => Integer
  column "Asset Amount",                    :required => false, :type   => Float
  column "Income Amount",                   :required => false, :type   => Float
  column "Negative Sign",                   :required => false
  column "Form 990 Revenue Amount",         :required => false, :type   => Float
  column "Negative Sign",                   :required => false
  column "NTEE Code",                       :required => false
  column "Sort or Secondary Name",          :required => false

  def save_to_db
    org = Organization.new
    org.assign_attributes clean_attrs, :without_protection => true
    org.save
  end

  def clean_attrs
    attrs = attributes.map {|k,v| [k.parameterize('_').to_sym , v.to_s.strip] }
    attrs = Hash[attrs]
    attrs[:ein] = attrs.delete(:e_i_n)
    attrs.delete(:negative_sign)
    attrs.delete(:blank)
    attrs
  end

end
