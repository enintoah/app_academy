class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    place_stones 
    @player_1 = name1
    @player_2 = name2
    @current_player = @player_1
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each.with_index do |subarr, idx|
      unless idx == 6 || idx == 13
        subarr.concat([:stone, :stone, :stone, :stone])
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos == 6 || start_pos == 13 || start_pos > 14 || start_pos < 0
    raise "Starting cup is empty" if @cups[start_pos].empty?
    return true 
  end

  def make_move(start_pos, current_player_name)
    if current_player_name == @player_1
      @current_player = @player_1
    else 
      @current_player = @player_2
    end

    num_of_stones = cups[start_pos].length 
    idx = start_pos
    cups[idx] = []

    until num_of_stones == 0
      idx += 1
      if @current_player == @player_1
        idx = 0 if idx == 13
      else 
        idx = 0 if idx == 14
        idx = 7 if idx == 6
      end
      cups[idx].push(:stone)
      num_of_stones -= 1
    end 
    render
    return next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx]
    if @current_player == @player_2 && ending_cup_idx == 13
      return :prompt
    elsif @current_player == @player_1 && ending_cup_idx == 6
      return :prompt
    end
    return :switch if cups[ending_cup_idx].length == 1
    return ending_cup_idx if cups[ending_cup_idx].length > 1
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    i = 0 
    j = 7
    while i <= 5 
      if !cups[i].empty?
        return false 
      end
      i += 1
    end 
    return true 
    while j <= 12
      if !cups[j].empty?
        return false 
      end
      j += 1
    end
    return true 
  end

  def winner
    case cups[6].length <=> cups[13].length 
    when -1
      return @player_2
    when 0
      return :draw
    when 1
      return @player_1
    end
  end
end
