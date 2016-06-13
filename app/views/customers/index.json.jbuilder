json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :birthday, :gender, :phone, :address, :email
  json.url customer_url(customer, format: :json)
end
