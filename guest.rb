class Guest

attr_reader :name, :favourite_song, :money


  def initialize(name, money, favourite_song='')
    @name = name
    @money = money.to_f
    @favourite_song = favourite_song
  end

def add_money(amount_to_add)
  @money += amount_to_add
end

def remove_money(amount_to_remove)
  @money -= amount_to_remove
end

def guest_cheers_when_favourite_song_is_played(songs)
  for song in songs
    if song.name() == @favourite_song
      return'Whooo!'
    end
  end
end


end
