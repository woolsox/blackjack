require_relative "deck"
require "pry"

class Game
  def initialize
    @deck = Deck.new
    @hand = @deck.draw.rank, @deck.draw.rank
    @hand = @hand.join(', ')
    start_game
    stop_game
  end

  def start_game
      puts "Your hand is #{@hand}"
      puts "Draw again?"
      gets.chomp
      p @hand = @deck.draw.rank
  end

  def stop_game
    abort("Stop!") if @hand.length === 2
  end
end


Game.new

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
