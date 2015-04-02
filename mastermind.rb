class Mastermind
  attr_reader :secret_code
  def initialize
    @secret_code = 4.times.map { rand(1..6) }
  end

  def play
    start_game
    won = false
    12.downto(1) do |i|
      puts "You have #{i} turns left."
      guess = codebreaker_guess
      keys = get_keys(secret_code, guess)
      # puts "secret_code is #{secret_code}"
      # puts "keys are #{keys}"
      won = judge(keys)
      if won
        win
        break
      end
      puts "Your guess was: #{draw_code(guess, keys)}"
    end
    lose unless won
    puts draw_code(secret_code)
  end

  def start_game
    puts "start the game..."
  end

  def win
    puts "Congratulations! You beat the Mastermind!"
    print "The Mastermind's secret code was: "
  end

  def lose
    puts "Sorry, you've run out of turns. The Mastermind has won."
    print "The Mastermind's secret code was: "
  end

  def codebreaker_guess
    puts "Use the number keys to indicate the colors you think make up the code."
    puts "Choose 4 colors total. eg '1 2 1 6'"
    puts (1..6).map { |e| color((e + 40), e)}.join(" ")
    gets.chomp.gsub(" ", "").chars.map { |e| e.to_i }
  end

  def judge(keys)
    true if keys == ([31] * 4)
  end
#end

def draw_code(code, keys = [])
  output = code.map { |e| color(e + 40) }
  output += keys.map { |e| color(e, "O") }
  output.join(" ")
end

def color(color_num, text = " ")
  "\033[#{color_num}m#{text}\033[0m"
end

def get_keys(code, guess)
  keys = []
  new_guess = []
  code_copy = Array.new(code)
  code_copy.delete_if.with_index do |e, i|
    if e == guess[i]
      keys << 31
      true
    else
      new_guess << guess[i]
      false
    end
  end
  code_copy.each do |e|
    if (new_guess.index(e))
      new_guess.delete_at(new_guess.index(e))
      keys << 0
    end
  end
  keys

  # keys = []
  # for i in (0...secret_code.length) do
  #   if secret_code[i] == guess[i]
  #     keys << 1
  #     secret_code.delete_at(i)
  #     guess.delete_at(i)
  #   end
  # end
  # secret_code.each_with_index

  # loop through

  # result = []
  # secret_code.each_with_index do |e, i|
  #   if e == guess[i]
      
  #   end
  # end

  # secret_code.map.with_index { |e, i| 1 if guess[i] == e }
  

  # secret_code.map.with_index do |e, i|
  #   if guess[i] == e
  #     1
  #   elsif condition
      
  #   end
  # end


end
end
def input
  puts "Use the number keys to make your guess from the following colors."
end

# guess.map do |e|
#   color(e)
# end

# def color(color_num, text = " ")
#   "\033[#{color_num}m#{text}\033[0m"
# end

game = Mastermind.new
game.play