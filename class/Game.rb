class Game
  attr_accessor :current_player,:question, :player1, :player2

  def initialize()
    @player1 = Player.new("player1")
    @player2 = Player.new("player2")
    @current_player = player1
  end
  
  def new_game
  until player1.score <= 0 || player2.score <= 0 
  @question = Question.new
  puts "#{current_player.name}," << question.ask_question

  answer= gets.chomp
  unless question.check_answer(answer.to_i)
    current_player.lose_score
    puts "#{current_player.name}: Seriously? No!"
  else puts "#{current_player.name}: Yes, You are correct!"
  end

  
  puts "#{player1.name}: #{player1.score}/3 vs #{player2.name}: #{player2.score}/3 "
  puts "--------New Turn--------"

  if self.current_player.name == "player1"
    self.current_player = player2
  
  else
    self.current_player = player1
  end

end
puts "--------GAME OVER--------"
puts "Good bye!"
  end
end