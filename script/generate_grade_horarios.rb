DIAS_SEMANA.each do |dia|
  (0..23).each do |hora|
    GradeHorario.create!(dia: dia, hora: "#{hora}:00")
  end
end