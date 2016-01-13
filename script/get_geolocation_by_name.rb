Seguidor.where("upper(location) NOT LIKE 'BRA%IL' AND location is not null and lat is null").each do |seguidor|
    location = Geocoder.search(seguidor.location)
    seguidor.lat = location[0].latitude
    seguidor.long = location[0].longitude
    seguidor.save!
end