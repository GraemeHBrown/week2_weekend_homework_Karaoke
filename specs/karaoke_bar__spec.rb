require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../karaoke_bar')

class TestKaraokeBar < MiniTest::Test

ENTRY_FEE = 15.00

  def setup
    @room1 = Room.new('Room 1', 20)
    @room2 = Room.new('Room 2', 20)
    @room3 = Room.new('Room 3', 20)
    @room4 = Room.new('Room 4', 20)
    @room4 = Room.new('Room 5', 20)
    @rooms = [@room1, @room2, @room3, @room4, @room5]
    @bar = KaraokeBar.new('Sing Sing!', @rooms, 15.00, 5)
  end

def test_get_name()
  assert_equal('Sing Sing!', @bar.name())
end

def test_bar_has_rooms()
  assert_equal(@bar.number_of_rooms, @bar.rooms().size())
end



end
