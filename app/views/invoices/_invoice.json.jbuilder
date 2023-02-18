json.extract! invoice, :id, :user_id, :from, :to, :description, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
