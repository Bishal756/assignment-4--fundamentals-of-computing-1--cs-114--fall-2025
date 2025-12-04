// shapes.pde — only drawing, no game logic

void drawBoard() {
  stroke(0);
  strokeWeight(2);

  // Vertical lines
  line(CELL_SIZE, 0, CELL_SIZE, height);
  line(CELL_SIZE * 2, 0, CELL_SIZE * 2, height);

  // Horizontal lines
  line(0, CELL_SIZE, width, CELL_SIZE);
  line(0, CELL_SIZE * 2, width, CELL_SIZE * 2);
}

void drawMarks() {
  for (int i = 0; i < 9; i++) {
    int row = i / 3;
    int col = i % 3;

    float x = col * CELL_SIZE;
    float y = row * CELL_SIZE;

    if (board[i] == X) {
      drawX(row, col);
    } 
    else if (board[i] == O) {
      drawO(row, col);
    }
  }
}

void drawX(int row, int col) {
  float x = col * CELL_SIZE;
  float y = row * CELL_SIZE;
  float m = CELL_SIZE * 0.2;

  strokeWeight(4);
  stroke(0);
  line(x + m, y + m, x + CELL_SIZE - m, y + CELL_SIZE - m);
  line(x + CELL_SIZE - m, y + m, x + m, y + CELL_SIZE - m);
}

void drawO(int row, int col) {
  float cx = col * CELL_SIZE + CELL_SIZE / 2;
  float cy = row * CELL_SIZE + CELL_SIZE / 2;

  noFill();
  stroke(0);
  strokeWeight(4);
  circle(cx, cy, CELL_SIZE * 0.6);
}
