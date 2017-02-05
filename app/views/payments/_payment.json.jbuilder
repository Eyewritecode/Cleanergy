json.extract! payment, :id, :number, :created_at, :updated_at
json.url payment_url(payment, format: :json)