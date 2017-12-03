class KaraokeBar

attr_reader :name, :rooms, :entry_fee, :number_of_rooms,
            :venue_capacity, :guest_count

  def initialize(name, rooms, entry_fee, number_of_rooms)
    @name = name
    @rooms = rooms || []
    @entry_fee = entry_fee.to_f
    @number_of_rooms = number_of_rooms.to_i
    @venue_capacity = 0
    @guest_count = 0
  end

  def calculate_venue_capacity(all_rooms)
    venue_size = 0
    for room in all_rooms
      venue_size += room.capacity()
    end
    @venue_capacity = venue_size
  end

end
