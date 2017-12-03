

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
    if @guest_count < @venue_capacity && has_entry_fee?(guest_to_admit)
      room_with_space = find_room_with_space(@rooms)
      room_with_space.check_in(guest_to_admit)
      guest_to_admit.remove_money(@entry_fee)
      @guest_count += 1
    else
      return "Sorry guest cannot be admitted."
    end
  end

  def find_room_with_space(rooms)
    for room in rooms
      if !room.room_full?()
        return room
      end
    end
    return nil
  end

  def has_entry_fee?(guest)
    if guest.money() >= @entry_fee
      return true
    end
    return false
  end



end
