class Room

attr_reader :name, :capacity, :guests, :songs
attr_writer :capacity

def initialize(name, capacity)
  @name = name
  @capacity = capacity.to_i
  @guests = []
  @songs = []
end

def guest_count()
  return @guests.size()
end

def check_in(guest)
  @guests.push(guest)
end

def check_out(guest)
  @guests.delete(guest)
end

def add_song(song_to_add)
  @songs.push(song_to_add)
end

def room_full?()
  if guest_count() >= @capacity
    return true
  end
  return false
end

def play_songs()
  for guest in @guests
    guest.guest_cheers_when_favourite_song_is_played(@songs)
  end
end

end
