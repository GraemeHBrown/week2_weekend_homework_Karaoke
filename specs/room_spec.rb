require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new('Room 1', 20)
    @guest1 = Guest.new('Fred', 15.00)
    @room2 = Room.new('Room 1', 20)
    @room2.check_in(@guest1)
  end

  def test_room_has_name()
    assert_equal('Room 1', @room.name())
  end

  def test_room_capacity()
    assert_equal(20, @room.capacity())
  end

  def test_room_starts_empty()
    assert_equal(0, @room.guest_count())
  end

  def test_room_has_no_songs_at_start()
    assert_equal(0, @room.songs().size())
  end

  def test_check_in__increases_guest_count()
    before_guest_count = @room.guest_count
    @room.check_in(@guest1)
    count_after_addition = @room.guest_count
    assert_equal(before_guest_count+1, count_after_addition)
  end

  def test_check_in__guests_contains_guest_added()
    assert_equal(false, @room.guests().include?(@guest1))
    @room.check_in(@guest1)
    assert_equal(true, @room.guests().include?(@guest1))
  end

  def test_guest_count__empty_room()
    assert_equal(0, @room.guest_count())
  end

  def test_check_out__decreases_guest_count()
    @room.check_out(@guest1)
    count_after_check_out = @room.guest_count
    assert_equal(0, count_after_check_out)
  end

  def test_check_out__guests_doesnt_contain_guest_checked_out()
    assert_equal(true, @room2.guests().include?(@guest1))
    @room2.check_out(@guest1)
    assert_equal(false, @room2.guests().include?(@guest1))
  end

end
