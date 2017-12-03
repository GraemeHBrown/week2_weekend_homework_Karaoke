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

  def admit_guest_to_bar(guest_to_admit)
    calculate_venue_capacity(@rooms)
    if @guest_count < @venue_capacity
      @guest_count += 1
    else
      return "Sorry bar is full.  No further guests can be admitted."
    end  
  end

end
