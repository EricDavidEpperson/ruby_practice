require 'pry'

class Card
  attr_accessor :suit, :face, :value

  def initialize suit, face, value
    @suit = suit
    @face = face
    @value = value
  end

  def display
    [@face, @suit].join("")
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

    @cards.shuffle!
  end

  def deal_card
    @cards.shift
  end
end

class Hand
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def value
    hand.map(&:value).inject(:+)
  end

  def display_hand
    hand.map(&:display).join(" ")
  end

  def take_card(card)
    @hand << card
  end
end

class Blackjack
  attr_accessor :deck, :player_hand, :dealer_hand

  def game
    @deck = Deck.new
    @player_hand = Hand.new
    @dealer_hand = Hand.new

    2.times do
      @player_hand.take_card(@deck.deal_card)
      @dealer_hand.take_card(@deck.deal_card)
    end

    check_for_blackjack
  end

  def check_for_blackjack
    if @player_hand.value == 21 && @dealer_hand.value < 21
      @player_hand.display_hand
      puts @player_hand.display_hand
      puts "Winner Winner Chicken Dinner! You have BlackJack!"
      exit
    elsif @dealer_hand.value == 21
      @dealer_hand.display_hand
      puts "Sorry but the dealer has Blackjack. You Lose"
      exit
    else player_plays
    end
  end

  def player_plays
    puts @player_hand.display_hand
    case @player_hand.value
    when 2..20
      hit_or_stay?
    when 21
      puts "You have 21! It is now the dealer's turn."
      dealer_plays
    else
      puts "You Busted! You Lose."
      exit
    end
  end

  def hit_or_stay?
    puts "Would you like to Hit (H) or Stay (S)?"
    case gets.upcase.chomp
    when "H"
      @player_hand.take_card(@deck.deal_card)
      player_plays
    when "S"
      dealer_plays
    else hit_or_stay?
    end
  end

  def dealer_plays
    puts @dealer_hand.display_hand
    case @dealer_hand.value
    when 2..16
      @dealer_hand.take_card(@deck.deal_card)
      dealer_plays
    when 17..21
      determine_winner
    else
      puts "Dealer Busted! You Win!"
      exit
    end
  end

  def determine_winner
    if @player_hand.value < @dealer_hand.value
      puts "Sorry You Lose!"
    elsif @player_hand.value > @dealer_hand.value
      puts "You Win!"
    else
      puts "It's a draw!"
    end
    exit
  end
end

blackjack = Blackjack.new
blackjack.game
