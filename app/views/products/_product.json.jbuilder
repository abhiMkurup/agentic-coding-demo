json.extract! product, :id, :name, :inventory_count, :created_at, :updated_at
json.url product_url(product, format: :json)
