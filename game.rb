# frozen_string_literal: true

# Dcoumentation: game.rb
class Cell
  def initialize(state)
    @state = state
  end

  def alive?
    @state == :live
  end

  def to_s
    @state == :live ? '*' : '.'
  end

  def next_state(neighbors)
    @next_state = :dead

    @next_state = :live if neighbors == 3
    @next_state = :live if neighbors.between?(2,3)
    @next_state = :dead
  end


end

# Documentation: game.rb
class Print_Grid 
  def initialize(grid)
    @grid = grid
  end

  def print_grid
    @grid.each do |row|
      row.each do |cell|
        print cell.to_s
      end
      puts
    end
  end
end

# Documentation: game.rb
class Grid
  def initialize(column, row)
    @array = Array.new(column, Array.new(row) { Random.rand(100).between?(60, 100) ? Cell.new(:live) : Cell.new(:dead) })
  end

  def print
    @array.each do |element|
      puts element.join
    end
  end

  def check_neighbors(col, row)
    neighbors = 0
    directions = [
      [col - 1, row - 1], # upper left neighbor
      [col, row - 1], # upper middle
      [col + 1, row - 1], # upper right
      [col - 1, row], # left
      [col + 1, row], # right
      [col - 1, row + 1], # bottom left
      [col, row + 1], # bottom middle
      [col + 1, row + 1] # bottom right
    ]

    directions.each do |col, row|
      if col >= 0 && col < @array.length && row >= 0 && row < @array[col].length
        neighbors += 1 if @array[col][row].alive?
      end
    end
  end

  def new_grid
    @array.each do |element|
      element.each do |cell|
        cell.next_state(check_neighbors(cell.col, cell.row))
      end
    end
  end
end

# Documentation: game.rb
class Game
  def initialize
    puts 'cuantas columnas'
    @column = gets.chomp.to_i
    puts 'cuantas filas'
    @row = gets.chomp.to_i
    @array = Grid.new(@column, @row)
    @array.print
  end
end

Game.new()
