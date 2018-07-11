require 'pry'
class Player

  attr_accessor :first_name, :last_name, :name, :position, :number, :twitter, :bio, :profile_url 

  @@all = []

  def initialize(player_hash)
    @name = player_hash[:name]
    @@all << self 
    
  end

  def self.create_from_collection(players_array)
    players_array.each do |player|
      self.new(player)
    end 
  end

  def add_player_attributes(attributes_hash)
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.all
   @@all  
  end

  binding.pry 
end

 