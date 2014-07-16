class Personne

  def initialize(family_name,first_name,age)
    @family_name = family_name
    @first_name = first_name
    @age = age
    @pasta = false
  end

  def retired?
    @age >= 60 ? "Profite de ta retraite" : "Va travailler !!!"
  end

  def like_pasta
    @pasta = true
  end

  def demand_pasta?
    if @pasta == true
      puts "Merci, j'adore les pates"
    else
      puts "Je deteste le pates, moi j'aime que le poulet héhé"
    end
  end
end

