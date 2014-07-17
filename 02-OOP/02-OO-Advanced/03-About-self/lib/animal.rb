class Animal
  # Modify the following methods to enable chaining !

  def name(name)
    @name = name
    self
    #TODO: find good instruction
  end

  def specie(specie)
    @specie = specie
    self
    #TODO: find good instruction
  end

  def color(color)
    @color = color
    self
    #TODO: find good instruction
  end

  def natural_habitat(natural_habitat)
    @natural_habitat = natural_habitat
    self
    #TODO: find good instruction
  end

  def to_s
    "Name: #{@name}, Specie: #{@specie}, Color: #{@color}, Natural Habitat: #{@natural_habitat}"
  end

end