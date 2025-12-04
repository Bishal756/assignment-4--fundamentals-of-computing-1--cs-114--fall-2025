// board.pde — logic only

int[] board = new int[9];
boolean gameOver = false;

void initBoard() {
  for (int i = 0; i < 9; i++) {
    board[i] = EMPTY;
  }
  gameOver = false;
}

// ----------- WIN CHECK ----------------

int checkWinner() {
  int[][] wins = {
    {0,1,2},{3,4,5},{6,7,8},
    {0,3,6},{1,4,7},{2,5,8},
    {0,4,8},{2,4,6}
  };

  for (int i = 0; i < wins.length; i++) {
    int a = wins[i][0];
    int b = wins[i][1];
    int c = wins[i][2];

    if (board[a] != EMPTY &&
        board[a] == board[b] &&
        board[b] == board[c]) {
      return board[a];
    }
  }
  return EMPTY;
}

boolean isBoardFull() {
  for (int i = 0; i < 9; i++) {
    if (board[i] == EMPTY) return false;
  }
  return true;
}

// ------------ COMPUTER MOVE ------------

void computerMove() {

  // Simple logic: choose first empty
  for (int i = 0; i < 9; i++) {
    if (board[i] == EMPTY) {
      board[i] = X;
      println("Computer played at square " + i);
      return;
    }
  }

  println("No moves left.");
}
