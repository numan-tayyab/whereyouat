class Location < ActiveRecord::Base

  before_create :validate_address, :check_unique_address
  geocoded_by :full_address,
              :latitude => :latitude, :longitude => :longitude
  after_validation :geocode #, :if => :address_changed?

  has_many :users, :through => :location_users #,:class_name => "LocationUser"
  has_many :location_users

  def full_address
    self.complete_address
  end

  def validate_address
    latitude.present? ? (return true) : (self.errors.add("error", "Address Not Found. Please Enter Valid Details") and return false)
  end

  def check_unique_address
    existing_location = Location.select { |location| location.latitude == latitude and location.longitude == longitude }
    existing_location.blank? ? (return true) : (self.errors.add(" ", "Address Already Exists") and return false)
  end

end
