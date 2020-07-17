class Board

  attr_reader :zones

  def initialize(zones)
    @zones = zones
  end

  def print_board
    board_arr = []
    @zones.each do |value|
      board_arr << value.to_s.tr(',', ' ')
    end
    board_arr
  end

  def create_xy_arr(player_sym)
    xy_arr = [player_sym, player_sym, player_sym]
    xy_arr
  end

end