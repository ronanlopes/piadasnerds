Seguidor.where("location is not null and lat is null").each do |seguidor|
  begin
    location = Geocoder.search(seguidor.location)
    seguidor.lat = location[0].latitude
    seguidor.long = location[0].longitude
    seguidor.save!
  rescue Exception=>e
    puts "Excessão: #{e.message}, Seguidor: #{seguidor.id}"
  end
end