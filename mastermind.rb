class Mastermind
  def initialize
    @secret_code = 4.times.map { rand(1..6) }
  end

  def play
    12.times do
      guess = codebreaker_guess
      if(judge(guess))
        end_game
        break
      end
    end
  end

  def codebreaker_guess
    puts "Make your guess."
    gets.chomp
  end

  def judge(keys)
    true if keys == #all 1's
  end
end

def draw_to_screen(code, keys)
  
end


def key
  keys = []
  new_guess = []
  code.delete_if.with_index do |e, i|
    if e == guess[i]
      keys << 1
      true
    else
      new_guess << guess[i]
      false
    end
  end
  code.each do |e|
    if (new_guess.index(e))
      new_guess.delete_at(new_guess.index(e))
      keys << 2
    end
  end

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

def input
  puts "Use the number keys to make your guess from the following colors."
end

guess.map do |e|
  color(e)
end

def color(color_num, text = " ")
  "\033[#{color_num}m#{text}\033[0m"
end