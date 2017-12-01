require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class TestSong < MiniTest::Test

  def setup
    @song = Song.new('Yellow Submarine', 'Beatles')
  end

  def test_song_name()
    assert_equal('Yellow Submarine', @song.name())
  end

  def test_song_has_artist_name()
    assert_equal('Beatles', @song.artist())
  end

end
