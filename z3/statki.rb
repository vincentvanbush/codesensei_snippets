class Game
  attr_reader :board

  def initialize
    # utworzenie planszy
    # rozstawienie statków
    create_board
    layout_ships
  end

  def guess(a, b)
    raise ArgumentError if a > 9 || a < 0 || b > 9 || b < 0 || @board[a][b] != :empty
    ship = @ships.select { |ship| ship.alive? }.find { |ship| ship.initial_fields.include?([a, b]) }
    if ship
      ship.strike(a, b)
      @board[a][b] = :hit
      if ship.alive?
        # niezatopiony
        :hit
      else
        # zatopiony
        # TODO: oznaczyć pudła dookoła zatopionego statku
        :sunk
      end
    else
      @board[a][b] = :miss
    end
  end

  def game_over?
    @ships.none?(&:alive?)
  end

  private

  def create_board
    @board = Array.new(10) { [:empty] * 10 }
  end

  def layout_ships
    # rozmieszczenie czteromasztowca
    @ships = []
    layout_ship(4)
    2.times { layout_ship(3) }
    3.times { layout_ship(2) }
    4.times { layout_ship(1) }
  end

  def layout_ship(count)
    loop do # pętli się dopóty, dopóki nie udało się z sukcesem rozstawić statku
      coords = [rand(10), rand(10)] # losowanie koordynat początkowych

      puts "Going to #{coords}"

      all_coords = []

      go_next = false

      count.times do # rozstawianie kolejnych pól
        fields_to_check = [
          [coords[0] - 1, coords[1] - 1], [coords[0], coords[1] - 1], [coords[0] + 1, coords[1] - 1],
          [coords[0] - 1, coords[1]], [coords[0], coords[1]], [coords[0] + 1, coords[1]],
          [coords[0] - 1, coords[1] + 1], [coords[0], coords[1] + 1], [coords[0] + 1, coords[1] + 1]
        ]

        can_place = fields_to_check.select do |current_coords|
          current_coords.all? { |coord| coord >= 0 && coord <= 9 }
        end.all? do |current_coords|
          @board[current_coords[0]][current_coords[1]] == :empty
        end

        unless can_place
          go_next = true
          break
        end

        possible_coords = [
          [coords[0] - 1, coords[1]],
          [coords[0] + 1, coords[1]],
          [coords[0], coords[1] - 1],
          [coords[0], coords[1] + 1]
        ].select do |current_coords|
          current_coords.all? { |coord| coord >= 0 && coord <= 9 } &&
            @ships.none? { |ship| ship.initial_fields.include?(current_coords) } &&
            !all_coords.include?(current_coords)
        end

        if possible_coords.length == 0
          go_next = true
          break
        end

        all_coords << coords

        coords = possible_coords.sample
        puts "Going to #{coords}"
      end

      next if go_next

      return @ships << Ship.new(all_coords)
    end
  end
end

class Ship
  attr_reader :initial_fields
  attr_reader :struck_fields

  def initialize(initial_fields)
    @initial_fields = initial_fields
    @struck_fields = []
  end

  def strike(a, b)
    raise ArgumentError if struck_fields.include?([a, b]) || !initial_fields.include?([a, b])
    @struck_fields << [a, b]
  end

  def alive?
    initial_fields.any? { |elem| !struck_fields.include?(elem) }
  end
end

# g = Game.new

# g.create_board
