json.array!(@nasabahs) do |nasabah|
  json.extract! nasabah, 
  json.url nasabah_url(nasabah, format: :json)
end