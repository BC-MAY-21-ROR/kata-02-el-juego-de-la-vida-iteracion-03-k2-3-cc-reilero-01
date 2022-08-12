class Cell
  def initialize(state)
  @state = state
  end
  
  def alive?
  @state == :live
  end
  
  def to_s
  @state== :live ? '*' : '.'
  end
  end
  
  class Grid
  def initialize(column, row)
  @array = Array.new(column,Array.new(row){ rand(100).between?(60,100) ? Cell.new(:live) : Cell.new(:dead)} )
  end
  
  def print
  @array.each do |element|
  puts element.join()
  end
  end
  end
  
  class Game
  def initialize
  puts "cuantas columnas"
  @column = gets.chomp.to_i
  puts "cuantas filas"
  @row = gets.chomp.to_i
  @array = Grid.new(@column, @row)
  @array.print
  end
  
  end
  
  Game.new()