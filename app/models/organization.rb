class Organization < ActiveRecord::Base

  geocoded_by :full_address
  after_validation :geocode, :if => :full_address_changed?, :unless => lambda { self.new_record? }

  validates_presence_of :name, :address

  def full_address
    ADDRESS_ATTRIBUTES.map {|attr| self.send(attr) }.reject(&:blank?).join(', ')
  end

  def full_address_changed?
    ADDRESS_ATTRIBUTES.any? {|attr| self.send("#{attr}_changed?") }
  end

  private

  ADDRESS_ATTRIBUTES = [ :address, :city, :state, :zip_code ]
end
