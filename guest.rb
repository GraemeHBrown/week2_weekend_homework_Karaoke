class Guest

attr_reader :name, :favourite_song, :money

  def initialize(name, favourite_song, money)
    @name = name
    @favourite_song = favourite_song || " "
    @money = money
  end



end
