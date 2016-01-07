class String
  def to_bool
    return true if self =~ (/^(true|t|yes|y|1)$/i)
    return false if self =~ (/^(false|f|no|n|0)$/i)
    return nil if self.empty? || self==""

    raise ArgumentError.new "invalid value: #{self}"
  end
end

require 'csv'
csv_text = File.read("doc/piadas_nerds_seguidores.csv")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  hash = row.to_hash
  begin
    hash["twitter_id"] = hash.delete "id"
    hash["verified"] = hash["verified"].to_bool if hash["verified"].is_a?(String)  
    hash["following"] = hash["following"].to_bool if hash["following"].is_a?(String)
    hash["created_at"] = hash["created_at"].try(:to_datetime) if hash["created_at"].is_a?(String) 
    Seguidor.create!(hash)
  rescue Exception=>e
    puts "Excessão"
    puts e.message
    puts hash
  end
end