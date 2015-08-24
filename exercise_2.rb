class Rover
  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
   @x = x
   @y = y
   @direction = direction
   #DIRECTIONS = ['N', 'E', 'S', 'W']
   #@current_facing = DIRECTIONS.index(@direction)
   #current_facing.rotate(1)
   #current_facing.rotate(-1)
  end

  def print_location
    puts ' ' * 3 + '_  ' * $plateau_x
    # Method 1
    # for i in ($plateau_y).downto(1)
    #   puts i.to_s + '|_' * $plateau_x + '|'
    #   i -= 1
    # end

    # Method 2
    for j in ($plateau_y).downto(1)
      if j >= 10
        print j.to_s
      else  
        print j.to_s + ' '
       end 
      for i in 1..$plateau_x
        print '|'
        if i == @x && j == @y
          print '*|'
        else
          print '_|'
        end
      end
    puts
    end

    print '0' + ' ' * 2
    for k in 1..$plateau_x
      if k >= 10
        print k.to_s + ' '
      else  
        print k.to_s + ' ' * 2
      end
    end
    puts
  end

  def read_instruction(command)
    if command == 'M'
      move
    elsif command == 'L'
      turn_left
    elsif command == 'R'
      turn_right
    else 
      puts "Wrong instruction detected. Rover stays still in this round." 
    end
  end

  def check_move_E
    if @x < $plateau_x
      @x += 1
    else
      puts "Rover has reached the East end of plateau!"
    end
  end

  def check_move_W
    if @x > 0
     @x -= 1
    else
      puts "Rover has reached the West end of plateau!"
    end
  end

  def check_move_N
    if @y < $plateau_y
     @y += 1
    else
      puts "Rover has reached the North end of plateau!"
    end
  end

  def check_move_S
    if @y > 0
     @y -= 1
    else
      puts "Rover has reached the South end of plateau!"
    end
  end

  def move
    if @direction == 'N'
      check_move_N
    elsif @direction == 'W'
      check_move_W
    elsif @direction == 'S'
      check_move_S
    elsif @direction == 'E'
      check_move_E
    end
  end

  def turn_left
    if @direction == 'N'
      @direction = 'W'
    elsif @direction == 'W'
      @direction = 'S'
    elsif @direction == 'S'
      @direction = 'E'
    elsif @direction == 'E'
      @direction = 'N'
    end
  end

  def turn_right
    if @direction == 'N'
      @direction = 'E'
    elsif @direction == 'E'
      @direction = 'S'
    elsif @direction == 'S'
      @direction = 'W'
    elsif @direction == 'W'
      @direction = 'N'
    end
  end
end

puts "Enter plateau size: "
plateau_size = gets.chomp.split.map {|x| x.to_i}
$plateau_x = plateau_size[0]
$plateau_y = plateau_size[1]

puts "Enter initial coordinates and direction: "
start_position_1 = gets.chomp.split(' ')
x = start_position_1[0].to_i
y = start_position_1[1].to_i
direction = start_position_1[2].upcase

DIRECTIONS = ['N', 'E', 'S', 'W'] # this is a constant
while (x > $plateau_x || x <= 0 || y > $plateau_y || y <= 0 || !DIRECTIONS.include?(direction))
  while x > $plateau_x || x <= 0
    print "X-coordinate has beyonded plateau! Please enter X-coordinate again: "
    x = gets.chomp.to_i    
  end 
  while y > $plateau_y || y <= 0
    print "Y-coordinate has beyonded plateau! Please enter Y-coordinate again: "  
    y = gets.chomp.to_i
  end 
  while DIRECTIONS.include?(direction) == false
    print "There's no #{direction} direction. Please enter direction again: "
    direction = gets.chomp
  end 
end

rover_1 = Rover.new(x, y, direction)
rover_1.print_location

puts "Enter commands: "
commands_1 = gets.chomp.upcase.split('')
commands_1.each do |command|
  rover_1.read_instruction(command)
end

puts 'Rover\'s current position is ' + rover_1.x.to_s + ' ' + rover_1.y.to_s + ' ' + rover_1.direction
rover_1.print_location