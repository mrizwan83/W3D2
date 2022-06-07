class HumanPlayer

   def get_input
    puts "enter a valid position row col seperated by a space like '3 2'"
    pos = gets.chomp.split.map(&:to_i)
    raise 'not valid input' if pos.length != 2
    pos
   end

   def receive_revealed_card(pos, val)
   end
end