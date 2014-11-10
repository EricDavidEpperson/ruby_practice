require 'pry'

class Card
  attr_accessor :suit, :face, :value

  def initialize suit, face, value
    @suit = suit
    @face = face
    @value = value
  end
end

class Deck

  def initialize
    @cards = []

    %w[ ♤ ♧ ♡ ♢ ].each do |suit|
      [2, 3, 4, 5, 6, 7, 8, 9, 10].each do |face|
        value = face
        @cards << Card.new(suit, face, value)
      end
    end

    %w[ ♤ ♧ ♡ ♢ ].each do |suit|
      {"J"=>10, "Q"=>10, "K"=>10, "A"=> 11}.each do |face, value|
        @cards << Card.new(suit, face, value)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end
end
