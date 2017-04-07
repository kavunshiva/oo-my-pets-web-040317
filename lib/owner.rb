require 'pry'

class Owner
  attr_accessor :name, :pets
  attr_reader :species
  ALL = []

  def initialize(species)
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
    ALL << self
  end

  # class methods
  def self.all
    ALL
  end

  def self.reset_all
    ALL.clear
  end

  def self.count
    ALL.size
  end

  # instance methods
  def say_species
    "I am a #{self.species}."
  end

  def buy_animal(species, animal, name)
    self.pets[species] << animal.new(name)
  end

  def buy_fish(name)
    buy_animal(:fishes, Fish, name)
  end

  def buy_dog(name)
    buy_animal(:dogs, Dog, name)
  end

  def buy_cat(name)
    buy_animal(:cats, Cat, name)
  end

  def make_animals_happy(species)
    self.pets[species].each { |animal| animal.mood = "happy"}
  end

  def walk_dogs
    make_animals_happy(:dogs)
  end

  def play_with_cats
    make_animals_happy(:cats)
  end

  def feed_fish
    make_animals_happy(:fishes)
  end

  def sell_pets
    self.pets.each do |species, animals|
      animals.each {|animal| animal.mood = "nervous"}
      animals.clear
    end
  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end

end
