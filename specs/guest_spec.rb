require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new('Fred', 20.00, 'Yellow Submarine')
    @guest2 = Guest.new('Joe', 20.00)
    @song1 = Song.new('Yellow Submarine', 'Beatles')
    @songs = [@song1]
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

  def test_guest_cheers_when_favourite_song_is_played()
    assert_equal('Whooo!', @guest.guest_cheers_when_favourite_song_is_played(@songs))
  end



end
