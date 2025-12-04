void setup() {
  size(500, 500);
  initBoard();          // from board.pde
  println("Tic Tac Toe — Computer is X, You are O");
  println("Use keys 0–8. Computer starts.");
  computerMove();        // X moves first
}

void draw() {
  background(255);
  drawBoard();           // from shapes.pde
  drawMarks();           // from shapes.pde
}


void keyPressed() {

  // If the game already ended
  if (gameOver) {
    println("Game has ended. Restart sketch to play again.");
    return;
  }

  // Only accept '0' to '8'
  if (key < '0' || key > '8') {
    println("Incorrect key. Press 0–8.");
    return;
  }

  int index = key - '0';

  // Player move (O)
  if (board[index] != EMPTY) {
    println("That square is already taken.");
    return;
  }

  board[index] = O;
  println("You played square " + index);

  // Check if user won
  if (checkWinner() == O) {
    println("You (O) win!");
    gameOver = true;
    return;
  }

  // Check for tie
  if (isBoardFull()) {
    println("No one has won.");
    gameOver = true;
    return;
  }

  println("Game still in play… computer moves.");

  // Computer move (X)
  computerMove();

  // Check if computer won
  if (checkWinner() == X) {
    println("Computer (X) wins!");
    gameOver = true;
    return;
  }

  // Check tie again
  if (isBoardFull()) {
    println("No one has won.");
    gameOver = true;
  }
}
