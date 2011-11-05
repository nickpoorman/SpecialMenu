class Vendor
  include Mongoid::Document
  include Geocoder::Model::Mongoid
  field :gid, :type => String
  field :name, :type => String
  field :coordinates, :type => Array
  field :address, :type => String

  geocoded_by :address               # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  reverse_geocoded_by :coordinates
  after_validation :reverse_geocode  # auto-fetch address

  embeds_many :specials

  belongs_to :user
end
