class MediaAsset
  include Mongoid::Document
  store_in collection: "mediaAssets"
  field :filename, type: String
  field :fumber, type: String
  field :created, type: String
  field :modified, type: String
  field :size, type: String
  field :checksum, type: String
  field :General, type: Hash
  field :VideoStream, type: Hash
  field :AudioStream, type: Hash
end
