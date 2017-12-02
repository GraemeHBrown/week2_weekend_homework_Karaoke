class KaraokeBar

attr_reader :name, :rooms, :number_of_rooms

  def initialize(name, rooms, entry_fee, number_of_rooms)
    @name = name
    @rooms = rooms || []
    @entry_fee = entry_fee.to_f
    @number_of_rooms = number_of_rooms.to_i
  end

end
