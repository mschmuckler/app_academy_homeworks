class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      4.times { cup << :stone } unless idx == 6 || idx == 13
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 1 || start_pos > 13
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].length
    @cups[start_pos] = []
    until stones.zero?
      start_pos >= 13 ? start_pos = 0 : start_pos += 1
      if current_player_name == @name1
        unless start_pos == 13
          @cups[start_pos] << :stone
          stones -= 1
        end
      else
        unless start_pos == 6
          @cups[start_pos] << :stone
          stones -= 1
        end
      end
    end

    if current_player_name == @name1 && start_pos == 13
      start_pos = 0
    elsif current_player_name = @name2 && start_pos == 6
      start_pos = 7
    end

    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    case ending_cup_idx
    when 13 then :prompt
    when 6 then :prompt
    else
      @cups[ending_cup_idx].length <= 1 ? :switch : ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if (0..5).to_a.all? { |i| @cups[0].empty? }
    return true if (7..12).to_a.all? { |i| @cups[0].empty? }
    false
  end

  def winner
    case @cups[6] <=> @cups[13]
    when -1 then @name2
    when 1 then @name1
    when 0 then :draw
    end
  end
end
