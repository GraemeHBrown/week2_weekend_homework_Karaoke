class Room

attr_reader :name, :capacity, :guests, :songs

def initialize(name, capacity)
  @name = name
  @capacity = capacity
  @guests = []
  @songs = []
end

def guest_count()
  return @guests.size()
end

def check_in(guest)
  @guests.push(guest)
end



end
