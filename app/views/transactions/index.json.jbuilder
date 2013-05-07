json.array!(@transactions) do |transaction|
  json.extract! transaction, :nasabah_id, :debit, :credit, :description, :product_id
  json.url transaction_url(transaction, format: :json)
end