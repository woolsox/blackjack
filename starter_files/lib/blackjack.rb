require_relative 'deck'
require 'pry'

class Game
 def initialize
  @cash = 100
  @deck = Deck.new
  start_game
 end

 # begining prompts and methods
 def start_game
  print "What's your name? "
  @player = gets.chomp
  puts "Welcome #{@player} to the Ruby blackjack!"
  puts "Here's a $#{@cash} chip...lets have some fun!"
  double_draw
  hit_or_stay
 end

 # wip drawing method
 def double_draw
  @player_hand = @deck.draw.rank, @deck.draw.rank
  @player_hand = @player_hand.join(', ')
  @dealer_hand = @deck.draw.rank, @deck.draw.rank
  @dealer_hand = @dealer_hand.join(', ')
  puts "Dealers hand: #{@dealer_hand[0]}, [ ]"
  puts "Your hand: #{@player_hand}"
 end

 # wip on single draw method
 def single_draw
  @player_hand = @player_hand + ", " + @deck.draw.rank.to_s
 end

 # just printing back the users input at the moment
 def hit_or_stay
  print 'Hit or stay? '
  answer = gets.chomp.downcase
  if answer[0] == "h"
    single_draw
    puts "Your hand is now: #{@player_hand} (Total: #{evaluate(@player_hand)})"
  elsif answer[0] == "s"
    puts "You decide to stay."
  else
    puts "Not a valid response"
    hit_or_stay
  end
 end

 def evaluate(hand)
  @result = hand.split(',').map do |s|
    if s === "A"
      s = 11
    else
      s.to_i
    end
  end
  @result.sum
 end

end

Game.new

# SECOND ATTEMPT
# class Game
#  def initialize
#   @deck = Deck.new
#   @hand = @deck.draw.rank, @deck.draw.rank
#   @hand = @hand.join(', ')
#   start_game
#   stop_game
#  end
#
#  def start_game
#   puts "Your hand is #{@hand}"
#   puts 'Draw again?'
#   gets.chomp
#   p @hand = @deck.draw.rank
#  end
#
#  def stop_game
#   abort('Stop!') if @hand.length === 2
#  end
# end
#
# Game.new

# FIRST ATTEMPT
# @deck = Deck.new
#
# def start_game
#   @cash = 100
#   @bet = 10
#   @hand = @deck.draw.rank, @deck.draw.rank
#   @hand = @hand.join(', ')
#
#   puts "A" if @hand.include? "A"
#
#
#
#   # puts "Welcome to the Ruby Casino, let's play blackjack!\n"
#   # puts "You have $#{@cash} and bet $#{@bet}"
#   # puts "Your cards are: #{@hand}"
#   # puts "Total: #{ace_check(@hand).sum}"
# end
#
# # def ace_check(hand)
# #   if @hand.include? "A"
# #     "A" = "11"
# #   end
#   # "A" = 11 if @hand.sum < 10
#   # "A" = 1 if @hand.sum > 11
# # end
#
# start_game

# def hit_or_stay
#   while true
#     print "Do you want to (h)it or (s)tay: "
#     answer = gets.chomp.downcase
#     if answer[0] ==
#     end
#   end
# end
