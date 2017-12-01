require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new('Fred', 'Yellow Submarine', 20.00)
  end

  def test_guest_name()
    assert_equal('Fred', @guest.name())
  end

  def test_favourite_song()
    assert_equal('Yellow Submarine', @guest.favourite_song())
  end

  def test_get_money()
    assert_equal(20.00, @guest.money())
  end

  


end
