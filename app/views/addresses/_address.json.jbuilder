json.extract! address, :id, :person_id, :street, :city, :state, :zipcode, :created_at, :updated_at
json.url address_url(address, format: :json)
