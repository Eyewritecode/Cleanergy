json.extract! billing, :id, :meter_number, :meter_image, :created_at, :updated_at
json.url billing_url(billing, format: :json)