json.extract! media_asset, :id, :filename, :fumber, :created, :modified, :size, :checksum, :created_at, :updated_at
json.url media_asset_url(media_asset, format: :json)
