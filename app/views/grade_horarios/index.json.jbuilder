json.array!(@grade_horarios) do |grade_horario|
  json.extract! grade_horario, :id, :dia, :hora, :conteudo
  json.url grade_horario_url(grade_horario, format: :json)
end
