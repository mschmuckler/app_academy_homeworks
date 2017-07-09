class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    unless @game_over
      self.round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    @seq.length.times do |color|
      puts @seq[color]
      sleep(0.5)
    end
  end

  def require_sequence
    puts "Test your memory, one color at a time:"
    guess_seq = []
    i = 0
    until guess_seq == @seq
      guess = gets.chomp
      guess_seq << guess
      if guess_seq[i] != @seq[i]
        @game_over = true
        break
      end
      i += 1
    end
  end

  def add_random_color
    colors = ['red', 'blue', 'yellow', 'green']
    @seq << colors.sample
  end

  def round_success_message
    puts "You live to see another color."
  end

  def game_over_message
    puts "Wrong answer. You lose."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  simon = Simon.new
  simon.play
end
