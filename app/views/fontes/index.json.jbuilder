json.array!(@fontes) do |fonte|
  json.extract! fonte, :id, :nome, :url
  json.url fonte_url(fonte, format: :json)
end
