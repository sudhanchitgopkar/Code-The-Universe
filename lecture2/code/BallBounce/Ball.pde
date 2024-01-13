class Ball {
  PVector pos, vel;
  float diameter;
  ArrayList<Ball> otherBalls;
  int numCollisions;
  
  public Ball(float initX, float initY) {
    pos = new PVector(initX,initY);
    vel = new PVector(random(-5, 5),random(-5, 5));
    
    diameter = 50;
    otherBalls = new ArrayList <> ();
    
    numCollisions = 0;
  } //Ball
  
  public void display() {
    //color (hue) depends on number of collisions
    fill(numCollisions, 255, 255);
    circle(pos.x, pos.y, diameter); 
  } //display
  
  public void move() {
    pos.add(vel);
    
    //checks for boundary collisions
    if (pos.y + diameter >= height) {
      pos.y = height - diameter;      
      vel.y *= -1;
    } else if (pos.y <= diameter) {
      pos.y = diameter;
      vel.y *= -1;
    } //if
    if (pos.x + diameter >= width) {
      pos.x = width - diameter;
      vel.x *= -1;
    } else if (pos.x <= diameter) {
      pos.x = diameter;
      vel.x *= -1;
    } //if
    
    //check for object/ball collisions
    for (int i = 0; i < otherBalls.size(); i++) {
      PVector otherPos = otherBalls.get(i).pos;
      float distance = dist(pos.x, pos.y, otherPos.x, otherPos.y);
   
      if (distance != 0 && distance < diameter) {
        numCollisions += 5; //5 for faster color changes
        
        //velocity changes are imperfect, use arctan to calculate angle between balls and calculate accordingly for proper sim
        vel.x *= -1;
        vel.y *= -1;
      } //if
      
    } //for
  } //move
  
  public void setBalls(ArrayList<Ball> balls) {
    this.otherBalls = balls;
  } //setBalls
} //Ball
