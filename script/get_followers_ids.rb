follower_ids = []
next_cursor = -1
while next_cursor != 0
  cursor = $twitter.follower_ids(:cursor => next_cursor)
  follower_ids.concat cursor.attrs.ids
  next_cursor = cursor.attrs.next_cursor
end
puts follower_ids