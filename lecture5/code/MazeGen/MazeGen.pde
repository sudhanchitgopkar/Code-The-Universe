import java.util.*;

Stack<int []> inProg;
Cell [][] grid;
int n;

void setup() {
  size(700,700);
  
  n = 80;
  grid = new Cell[n][n];
  
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      grid[i][j] = new Cell(new PVector(i * 1.0/n * width, j * 1.0/n * height), 1.0/n * width);
    } //for
  } //for
  
  inProg = new Stack <> ();
  inProg.push(new int [] {0, 0});
  
} //setup

void draw() {
  background(255);
  displayGrid();
  updateGrid();
  if (inProg.isEmpty()) noLoop();
} //draw

void updateGrid() {
  if (inProg.isEmpty()) {
    return;
  } //if
  
  int [] curr = inProg.pop();
  int x = curr[0], y = curr[1];
  grid[x][y].visited = true;
  
  int [][] dirs = new int [][] {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
  Collections.shuffle(Arrays.asList(dirs));
  
  for (int [] dir : dirs) {
    int nx = x + dir[0], ny = y + dir[1];
    if (in(nx, ny) && !grid[nx][ny].visited) {
      inProg.push(curr);
      inProg.push(new int [] {nx, ny});
      
      if (dir[0] == -1) {
        grid[x][y].w = false;
        grid[nx][ny].e = false;
      } else if (dir[0] == 1) {
        grid[x][y].e = false;
        grid[nx][ny].w = false;
      } else if (dir[1] == -1) {
        grid[x][y].n = false;
        grid[nx][ny].s = false;
      } else {
        grid[x][y].s = false;
        grid[nx][ny].n = false;
      } //if
      grid[nx][ny].visited = true;
    } //if
  } //for
 
} //updateGrid

void displayGrid() {
  int [] curr = inProg.peek();
  int x = curr[0], y = curr[1];
  
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      if (i == x && j == y) fill(255, 0, 0);
      else noFill();
      grid[i][j].display();
    } //for
  } //for
} //displayGrid

boolean in(int x, int y) {
  return x >= 0 && x < n && y >= 0 && y < n;
} //in
