class Game
  attr_accessor :current_player,:question, :player1, :player2, :winner

  def initialize()
    @player1 = Player.new("player 1")
    @player2 = Player.new("player 2")
    @current_player = player1
  end
  
  def check_result
    current_player.score <= 0
  end
  
  def swith_turn 
    if self.current_player.name == "player 1"
      self.current_player = player2
      
    else
      self.current_player = player1
    end
  end

  def new_game
    
    until self.check_result
    @question = Question.new
    puts "#{current_player.name}," << question.ask_question
  
    answer= gets.chomp
    unless question.check_answer(answer.to_i)
      current_player.lose_score
      puts "#{current_player.name}: Seriously? No!"
    else puts "#{current_player.name}: Yes, You are correct!"
    end
    
    if not self.check_result
    puts "#{player1.name}: #{player1.score}/3 vs #{player2.name}: #{player2.score}/3 "
    puts "--------New Turn--------"
    self.swith_turn
    end
    end
    self.swith_turn
    @winner = current_player
    puts "#{@winner.name} wins with a scores of #{@winner.score}/3"
    puts "--------GAME OVER--------"
    puts "Good bye!"
  end

  
end