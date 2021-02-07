class Owner

  attr_accessor :cats, :pets
  attr_reader :name, :species

  @@all = []
  

def initialize(name)
  @name = name
  @species = "human"
  @@all << self
  @pets = {:fishes => [], :dogs => [], :cats => []} 
end

def say_species
  return "I am a #{@species}."
end

def self.all
  @@all
end

def self.count
  @@all.count
end

def self.reset_all
  @@all.clear
end

def cats
  Cat.all.select do |cat|
    cat.owner == self
  end
end

def dogs
  Dog.all.select do |dog|
    dog.owner == self
  end
end

def buy_cat(name)
  Cat.new(name, self)
end

def buy_dog(name)
  Dog.new(name,self)
end

def walk_dogs
  dogs = self.dogs
    dogs.each do |dog|
      dog.mood = "happy"
  end
end

def feed_cats
  cats = self.cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    cats = self.cats
    cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  
    dogs = self.dogs
    dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
  end
  end

  def list_pets
    return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  
  end


end