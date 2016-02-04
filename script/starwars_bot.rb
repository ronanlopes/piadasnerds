topics = ["star wars", "yoda", "darth vader", "luke", "skywalker", "han solo", "chewbacca"]
i=0
$twitter_streaming.filter(track: topics.join(",")) do |object|
  if object.user.lang=="pt"
    i+=1
    puts "twittando para #{object.user.name} pelo texto: #{object.text}"
    $twitter.update("@#{object.user.screen_name} Que a força esteja com você!", in_reply_to_status_id: object.id)
  end
  if i >= 15
    sleep(1.hour)
    i=0
  end
end