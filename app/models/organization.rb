class Organization < ActiveRecord::Base
  attr_accessible :ntee, :name, :zip, :address, :latitude, :longitude
  geocoded_by :full_address
  after_validation :geocode, :if => :full_address_changed?
  validates_presence_of :name, :address

  def full_address
    [address, zip].join(', ')
  end

  def full_address_changed?
    address_changed? || zip_changed?
  end

end
