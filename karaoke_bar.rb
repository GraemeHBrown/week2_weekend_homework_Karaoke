class KaraokeBar

attr_reader :name

  def initialize(name, rooms, entry_fee, number_of_rooms)
    @name = name
    @rooms = rooms || []
    @entry_fee = entry_fee
    @number_of_rooms = number_of_rooms
  end

end
