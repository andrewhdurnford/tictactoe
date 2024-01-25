# win conditions
LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

# main function to run multiple games
def main
  playing = "Y"

  while playing.downcase == "y" do
    play
    puts "Play again? (Y/N)"
    playing = gets.chomp
  end

end

# play function to run game
def play
  # initialize variables
  board = [0,1,2,3,4,5,6,7,8,9]
  valid = [1,2,3,4,5,6,7,8,9]
  p1 = []
  p2 = []
  p1_turn = true

  # check for winner or draw, progress game
  while !winner(LINES, p1, p2) && !valid.empty?
    turn(p1_turn, board, valid, p1, p2)
    p1_turn = !p1_turn
  end

  # print result
  puts winner(LINES, p1, p2) || "It's a draw!"
  display(board)
end

# turn function
def turn (p1_turn, board, valid, p1, p2)
  player = p1_turn ? 'Player 1' : 'Player 2'
  puts "#{player}'s turn:"
  display(board)
  move = gets.to_i
  while !valid.include?(move)
    puts "Invalid move. Please try again: "
    move = gets.to_i
  end
  board[move] = p1_turn ? "X" : "O"
  p1_turn ? p1.push(move) : p2.push(move)
  valid.delete(move)
end

# display gameboard
def display(board)
  puts "#{board[1]} | #{board[2]} | #{board[3]}"
  puts "--+---+--"
  puts "#{board[4]} | #{board[5]} | #{board[6]}"
  puts "--+---+--"
  puts "#{board[7]} | #{board[8]} | #{board[9]}"
end

# check for winner
def winner(lines, p1, p2)
  lines.each do |line|
    return "Player 1 wins!" if line.all? { |pos| p1.include?(pos) }
    return "Player 2 wins!" if line.all? { |pos| p2.include?(pos) }
  end
  nil
end

main
