require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new('Fred', 20.00, 'Yellow Submarine')
    # @guest.favourite_song='Yellow Submarine'
    @guest2 = Guest.new('Joe', 20.00)
  end

  def test_guest_name()
    assert_equal('Fred', @guest.name())
  end

  def test_favourite_song()
    assert_equal('Yellow Submarine', @guest.favourite_song())
  end

  def test_guest_without_favourite_song_returns_empty_string()
    assert_equal("", @guest2.favourite_song())
  end

  def test_get_money()
    assert_equal(20.00, @guest.money())
  end

  def test_add_money()
    before_amount = @guest.money()
    @guest.add_money(5.00)
    after_amount = @guest.money()
    assert_equal(before_amount+5.00, after_amount)
  end

  def test_remove_money()
    before_amount = @guest.money()
    @guest.remove_money(5.00)
    after_amount = @guest.money()
    assert_equal(before_amount-5.00, after_amount)
  end

end
