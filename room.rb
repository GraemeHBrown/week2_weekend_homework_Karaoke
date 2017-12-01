class Room

attr_reader :name, :capacity

def initialize(name, capacity, guests, songs)
  @name = name
  @capacity = capacity
  @guests = guests || []
  @songs = songs || []
end



end
