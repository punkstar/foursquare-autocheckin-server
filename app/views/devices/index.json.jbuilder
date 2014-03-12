json.array!(@devices) do |device|
  json.extract! device, :id, :name, :mac_address
  json.url device_url(device, format: :json)
end
