require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new('Room 1', 20)

    @guest1 = Guest.new('Fred', 15.00, 'Yellow Submarine')
    @room2 = Room.new('Room 2', 1)
    @room2.check_in(@guest1)
    @room3 = Room.new('Room 3', 20)
    @room4 = Room.new('Room 4', 20)
    @room3.check_in(@guest1)
    @room4.check_in(@guest1)
    @song1 = Song.new('Yellow Submarine', 'Beatles')
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

  def test_add_song_to_room()
    assert_equal(false, @room.songs().include?(@song1))
    @room.add_song(@song1)
    assert_equal(true, @room.songs().include?(@song1))
  end

  def test_full_room_returns_true()
    assert_equal(true, @room2.room_full?())
  end

  def test_room_with_capacity_returns_false_for_room_full?()
    assert_equal(false, @room3.room_full?())
  end


end
