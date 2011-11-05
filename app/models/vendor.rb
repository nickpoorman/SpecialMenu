class Vendor
  include Mongoid::Document
  field :gid, :type => String
  field :name, :type => String

  embeds_many :specials
end
