class Special
  include Mongoid::Document
  field :shortdesc, :type => String
  field :desc, :type => String
  field :price, :type => Float
  field :avail, :type => Date

  embedded_in :vendor
end
