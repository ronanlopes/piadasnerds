Geocoder::Configuration.always_raise << Geocoder::OverQueryLimitError
Seguidor.where("upper(location) NOT LIKE 'BRA%IL' AND location is not null and lat is null").each_with_index do |seguidor, i|
  begin
    location = Geocoder.search(seguidor.location)
    seguidor.lat = location[0].try(:latitude)
    seguidor.long = location[0].try(:longitude)
    if seguidor.lat && seguidor.long
      seguidor.save!
    else
      seguidor.update_column(:location, nil)
    end
  rescue Geocoder::OverQueryLimitError
    puts "Limite de Requisições excedido! Dormindo... zzzZZzzZZzz"
    i = i - 1
    sleep(1.day)
  end
end