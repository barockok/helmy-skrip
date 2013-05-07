json.array!(@products) do |product|
  json.extract! product, :name, :first_credit, :month_credit, :description, :months_period, :version, :code
  json.url product_url(product, format: :json)
end