json.array!(@statuses) do |status|
  json.extract! status, :id, :name, :description, :order, :is_final
  json.url status_url(status, format: :json)
end
