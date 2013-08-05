json.array!(@contents) do |content|
  json.extract! content, :name, :body
  json.url content_url(content, format: :json)
end
