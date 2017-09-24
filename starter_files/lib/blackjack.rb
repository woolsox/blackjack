require_relative 'deck'
require 'pry'
require 'colorize'

class Game
 def initialize
  @bust = false
  @deck = Deck.new
  game_loop
 end

 # begining prompts and methods
 def start_game
  @cash = 100
  print "What's your name? ".green
  @player = gets.chomp
  sleep(1)
  puts "Welcome #{@player.capitalize} to Ruby Blackjack!".green
  sleep(1)
  puts "Here's a $#{@cash} chip, lets have some fun!".green
  sleep(1)
  double_draw
 end

 # wip drawing method
 def double_draw
  @player_hand = @deck.draw.rank, @deck.draw.rank
  @player_hand = @player_hand.join(', ')
  @dealer_hand = @deck.draw.rank, @deck.draw.rank
  @dealer_hand = @dealer_hand.join(', ')
  puts "Dealers hand: #{@dealer_hand[0]}, [?]".red
  puts "Your hand: #{@player_hand} (Total: #{evaluate(@player_hand)})".blue
  hit_or_stay
 end

 # just printing back the users input at the moment
 def hit_or_stay
  @player_turn = true
  while @bust == false && @player_turn == true
   print 'Hit or stay? '.green
   answer = gets.chomp.downcase
   if answer[0] == 'h'
    single_draw
    puts "Your hand is now: #{@player_hand} (Total: #{evaluate(@player_hand)})".blue
    hit_or_stay
   elsif answer[0] == 's'
    puts 'You decide to stay.'.green
    @player_turn = false
    dealer_play
   else
    puts 'Not a valid response'.green
    hit_or_stay
   end
  end
 end

 # wip on single draw method
 def single_draw
  @player_hand = @player_hand + ', ' + @deck.draw.rank.to_s
 end

 def dealer_draw
  @dealer_hand = @dealer_hand + ', ' + @deck.draw.rank.to_s
 end

 # evalutes any hand passed to it.
 def evaluate(hand)
  @result = hand.split(',').map do |s|
   if s.include? 'A'
    s = 11
   elsif s.include? 'J'
    s = 10
   elsif s.include? 'Q'
    s = 10
   elsif s.include? 'K'
    s = 10
   else
    s.to_i
   end
  end
  if @result.sum > 21
   @cash -= 10
   puts 'You bust.'.green
   @bust = true
   play_again
  elsif @result.sum == 21
   @cash += 20
   puts 'Blackjack!'.yellow
   play_again
  end
  @result.sum
 end

 # method to prompt player to play again
 def play_again
  print 'Play again? '.green
  answer = gets.chomp.downcase
  if answer[0] == 'y'
   @player_turn = true
   @bust = false
   puts "You've got $#{@cash} left.".green
   double_draw
   hit_or_stay
  else
   puts 'Goodbye!'.yellow
   exit
  end
 end

 # wip for managing dealers hand (non-functioning atm)
 def dealer_play
  if evaluate(@dealer_hand) <= 16
   dealer_draw
   puts "Dealers hand is #{evaluate(@dealer_hand)}".red
   who_wins
  elsif evaluate(@dealer_hand) >= 21
   @cash += 20
   puts "Dealer busts, you win! #{evaluate(@dealer_hand)}".red
   who_wins
   play_again
  end
 end

 def who_wins
  if evaluate(@dealer_hand) < evaluate(@player_hand)
   @cash += 20
   puts 'You beat the dealer!'.blue
   play_again
  elsif evaluate(@dealer_hand) > evaluate(@player_hand)
   @cash -= 10
   puts 'The dealer beat you!'.red
   play_again
  end
 end

 def game_loop
  start_game
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
