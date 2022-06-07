class Board 

    def self.from_file(file)
        rows = File.readlines(file).map(&: chomp)

    def initialize(grid)
        Board.from_file("sudoku1.txt")
