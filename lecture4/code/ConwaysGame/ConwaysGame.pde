boolean [][] grid;
boolean paused;
int n;

void setup () {
  size(500, 500);
  
  n = 10; //num rows/cols in grid
  grid = new boolean [n][n];
  paused = true;
} //setup

void draw() {
  background(255);
  drawGrid();
  if (!paused) updateGrid();
} //draw

void drawGrid() {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      //color green if alive, blank otherwise
      if (grid[i][j]) fill(0,255,0);
      else noFill();
      
      square((i * 1.0)/n * width, 
             (j * 1.0)/n * height,
             1.0/n * width);
    } //for
  } //for
} //drawGrid

void updateGrid() {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      int numNeighbors = countNeighbors(i, j);
      
      //apply GOL rules
      if (grid[i][j]) {
        if (numNeighbors < 2) grid[i][j] = false; //underpop
        else if (numNeighbors >= 4) grid[i][j] = false; //overpop
      } else {
        if (numNeighbors == 3) grid[i][j] = true; //reproduction
      } //if
      
    } //for
  } //for
} //update

int countNeighbors(int row, int col) {
  int [][] dirs = new int [][] {{-1, 0}, {1, 0}, {0, -1}, {0, 1}, //cardinals
                                {-1, 1}, {-1, -1}, {1, 1}, {1, -1}}; //diagonals
  int numNeighbors = 0;
  
  for (int [] nextDir : dirs) {
    int nextRow = row + nextDir[0], nextCol = col + nextDir[1];
    if (isIn(nextRow, nextCol) && grid[nextRow][nextCol]) {
      numNeighbors++;
    } //if
  } //for
  
  return numNeighbors;
} //countNeighbors

boolean isIn (int row, int col) {
  return row >= 0 && row < n && col >= 0 && col < n;
} //isIn

void mousePressed() {
  //get cell corresponding to mouse loc
  int x = int(mouseX/(1.0/n * width)), y = int(mouseY/(1.0/n * height));
  grid[x][y] = !grid[x][y];
} //mousePressed

void keyPressed() {
  paused = !paused;
} //keyPressed
