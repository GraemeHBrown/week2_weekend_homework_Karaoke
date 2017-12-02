require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')
require_relative('../song')
require_relative('../karaoke_bar')

class TestKaraokeBar < MiniTest::Test

  def setup
    @bar = KaraokeBar.new('Sing Sing!', [], 15.00, 5)
  end

def test_get_name()
  assert_equal('Sing Sing!', @bar.name())

end


end
