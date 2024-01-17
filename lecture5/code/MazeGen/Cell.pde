class Cell {
  PVector pos;
  float len;
  boolean visited;
  boolean n, e, s, w;
  
  public Cell(PVector initPos, float len) {
    this.pos = initPos;
    this.len = len;
    
    visited = false;
    n = true;
    e = true;
    s = true;
    w = true;
  } //Cell
  
  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    
    if (n) line(0, 0, len, 0);
    if (e) line(len, 0, len, len);
    if (s) line(0, len, len, len);
    if (w) line(0, 0, 0, len);
    
    noStroke();
    square(0, 0, len);
    stroke(0);
    
    popMatrix();
  } //display
} //class
