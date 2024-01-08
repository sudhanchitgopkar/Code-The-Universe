class Walker {
  protected int x, y;
  
  public Walker(int initX, int initY) {
    //set initial x and y values to given parameters
    x = initX;
    y = initY;
  } //Walker
  
  public void move() {
    //generate random num between 0 - 3 (inclusive) to determine next direction
    int nextDir = int(random(4));
    
    if (nextDir == 0) {
      //move right
      x += 1;
    } else if (nextDir == 1) {
      //move left
      x -= 1;
    } else if (nextDir == 2) {
      //move up
      y += 1;
    } else {
      //move down
      y -= 1;
    } //else
    
    
    //constraints suggested by Jasmine Andresol
    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
  } //move
  
  public void display() {
    //get the color of the John Harvard statue at walker's current location
    stroke(pixels[y * width + x]);
    //and plot it
    point(x,y);
  } //display
} //Walker
