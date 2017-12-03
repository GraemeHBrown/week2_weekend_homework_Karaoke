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


end
