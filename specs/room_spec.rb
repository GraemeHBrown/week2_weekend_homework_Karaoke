require('minitest/autorun')
require('minitest/rg')
require_relative('../room')

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new('Room 1', 20)
  end

  def test_room_has_name()
    assert_equal('Room 1', @room.name())
  end

  def test_room_capacity()
    assert_equal(20, @room.capacity())
  end

  def test_room_starts_empty()
    assert_equal(0, @room.guests().size())
  end

  def test_room_has_no_songs_at_start()
    assert_equal(0, @room.songs().size())
  end



end
