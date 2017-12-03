require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../karaoke_bar')
require_relative('../guest')

class TestKaraokeBar < MiniTest::Test


  def setup
    @room1 = Room.new('Room 1', 20)
    @room2 = Room.new('Room 2', 20)
    @room3 = Room.new('Room 3', 20)
    @room4 = Room.new('Room 4', 20)
    @room5 = Room.new('Room 5', 20)
    @room_with_reduced_capacity = Room.new('Room 6', 1)
    @reduced_capacity_rooms = [@room_with_reduced_capacity]
    @rooms = [@room1, @room2, @room3, @room4, @room5]
    @bar = KaraokeBar.new('Sing Sing!', @rooms, 15.00, 5)
    @guest1 = Guest.new('Joe', 20.00, 'Hey Jude')
    @guest2 = Guest.new('Jane', 20.00, 'Sergeant Pepper')
    @bar2 = KaraokeBar.new('Sing Sing 2!', @reduced_capacity_rooms, 15.00, 1)
  end

  def test_get_name()
    assert_equal('Sing Sing!', @bar.name())
  end

  def test_bar_has_rooms()
    assert_equal(@bar.number_of_rooms, @bar.rooms().size())
  end

  def test_bar_has_entry_fee()
    assert_equal(15.00, @bar.entry_fee())
  end

  def test_bar_has_room_count()
    assert_equal(5, @bar.number_of_rooms())
  end

  def test_venue_capacity()
    @bar.calculate_venue_capacity(@rooms)
    assert_equal(100, @bar.venue_capacity())
  end

  def test_making_change_to_room_size_affects_overall_bar_capacity()
    before_size = @bar.calculate_venue_capacity(@rooms)
    assert_equal(before_size, @bar.venue_capacity())
    amount_to_reduce = 5
    @room1.capacity -= amount_to_reduce
    after_size = @bar.calculate_venue_capacity(@rooms)
    assert_equal(before_size-amount_to_reduce, after_size)
  end

  def test_initial_bar_guest_count_is_0()
    assert_equal(0, @bar.guest_count())
  end

  def test_admitting_guest_to_bar_increases_guest_count()
    before_admitting_guest = @bar.guest_count()
    @bar.admit_guest_to_bar(@guest1)
    after_admitting_guest = @bar.guest_count()
    assert_equal(before_admitting_guest+1, after_admitting_guest)
  end

  def test_admit_guest_to_full_bar_doesnt_increase_guest_count()
    before_admitting_guest = @bar2.guest_count()
    assert_equal(0, before_admitting_guest)
    @bar2.admit_guest_to_bar(@guest1)
    @bar2.admit_guest_to_bar(@guest2)
    after_admitting_guests = @bar2.guest_count()
    assert_equal(before_admitting_guest+1, after_admitting_guests)
  end

  def test_total_admitted_guests_not_greater_than_venue_capacity()
    venue_capacity = @bar2.calculate_venue_capacity(@reduced_capacity_rooms)
    before_admitting_guest = @bar2.guest_count()
    assert_equal(0, before_admitting_guest)
    @bar2.admit_guest_to_bar(@guest1)
    @bar2.admit_guest_to_bar(@guest2)
    after_admitting_guests = @bar2.guest_count()
    assert_equal(venue_capacity, after_admitting_guests)
  end

  def test_trying_to_admit_more_guests_than_capacity_raises_message()
    before_admitting_guest = @bar2.guest_count()
    assert_equal(0, before_admitting_guest)
    @bar2.admit_guest_to_bar(@guest1)
    message = @bar2.admit_guest_to_bar(@guest2)
    assert_equal('Sorry bar is full.  No further guests can be admitted.', message)
  end

end
