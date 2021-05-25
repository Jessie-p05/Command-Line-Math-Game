class Question 
  attr_accessor :correct_answer, :num1, :num2

  def initialize
  @num1 = rand(1..21)
  @num2 = rand(1..21)
  @correct_answer = num1 + num2
  end
  
  def ask_question
  "what does #{num1} plus #{num2}?"
  end
  
  def check_answer(answer)
  answer == correct_answer.to_i
  end
end