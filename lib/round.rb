require './lib/turn'
require './lib/card'

class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.rotate
    @turns.last
  end
#
#   def guess_correct
#     @turns.each do |turn|
#       turn.correct?
#   end
# end
# ^^^ IDK IF I NEED THS OR NOT ^^^

 def number_correct
    correct = []
   @turns.each do |turn|
      if turn.correct?
        correct << turn
      end
    end
   correct.count
  end


def number_correct_by_category(category)
   correct_by_category = []
   @turns.each do |turn|
     if turn.correct? && turn.card.category == category
     correct_by_category << turn
     end
   end
   correct_by_category.length
 end
end
