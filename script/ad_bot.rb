topics = ["piadas nerds", "star wars", "marvel", "schrodinger", "pavlov"]
i=0
$twitter_streaming.filter(track: topics.join(",")) do |object|
  if object.user.lang=="pt"
    i+=1
    puts "twittando para #{object.user.name}"
    $twitter.update("@#{object.user.screen_name} Oi, #{object.user.name}! Você conhece o @piadasnerds? Dá uma conferida lá que você vai gostar ;)")
  end
  if i >= 15
    sleep(1.hour)
    i=0
  end
end