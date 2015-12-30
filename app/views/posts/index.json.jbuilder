json.array!(@posts) do |post|
  json.extract! post, :id, :cod, :data, :fonte, :materia, :legenda, :desempenho
  json.url post_url(post, format: :json)
end
