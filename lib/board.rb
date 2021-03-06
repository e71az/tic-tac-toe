class Board
  def initialize(zones, current_player, numbers_selected)
    @zones = zones
    @current_player = current_player
    @numbers_selected = numbers_selected
  end

  def print_board
    board_arr = []
    @zones.each do |value|
      board_arr << value.to_s.tr(',', ' ')
    end
    board_arr
  end

  def change_value(input, player_sym) # rubocop:disable Metrics/CyclomaticComplexity
    case input
    when 1
      @zones[0][0] = player_sym
    when 2
      @zones[0][1] = player_sym
    when 3
      @zones[0][2] = player_sym
    when 4
      @zones[1][0] = player_sym
    when 5
      @zones[1][1] = player_sym
    when 6
      @zones[1][2] = player_sym
    when 7
      @zones[2][0] = player_sym
    when 8
      @zones[2][1] = player_sym
    when 9
      @zones[2][2] = player_sym
    end
  end

  def create_xy_arr(player_sym)
    xy_arr = [player_sym, player_sym, player_sym]
    xy_arr
  end

  def columns(position)
    test_arr = []
    @zones.each do |x|
      test_arr << x[position]
    end
    test_arr
  end

  def winning_rows(position)
    @zones[position]
  end

  def winning_diagonals_left(position)
    test_arr_diag_left = []
    @zones.each do |x|
      test_arr_diag_left << x[position]
      position += 1
    end
    test_arr_diag_left
  end

  def winning_diagonals_right(position)
    test_arr_diag_right = []
    @zones.each do |x|
      test_arr_diag_right << x[position]
      position -= 1
    end
    test_arr_diag_right
  end

  def decide_winner(symbol_array) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    xy_arr = symbol_array

    if columns(0) == xy_arr || columns(1) == xy_arr || columns(2) == xy_arr # rubocop:disable Style/MultipleComparison
      'win'
    elsif winning_rows(0) == xy_arr || winning_rows(1) == xy_arr || winning_rows(2) == xy_arr # rubocop:disable Style/MultipleComparison
      'win'
    elsif winning_diagonals_left(0) == xy_arr || winning_diagonals_right(2) == xy_arr # rubocop:disable Style/MultipleComparison
      'win'
    else false
    end
  end
end
