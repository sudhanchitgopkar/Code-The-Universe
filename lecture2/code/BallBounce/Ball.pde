class Ball {
  PVector pos, vel;
  float radius;
  ArrayList<Ball> otherBalls;
  int numCollisions;
  
  public Ball(float initX, float initY) {
    pos = new PVector(initX,initY);
    vel = new PVector(random(-5, 5),random(-5, 5));
    
    radius = 50;
    otherBalls = new ArrayList <> ();
    
    numCollisions = 0;
  } //Ball
  
  public void display() {
    //color (hue) depends on number of collisions
    fill(numCollisions, 255, 255);
    circle(pos.x, pos.y, radius); 
  } //display
  
  public void move() {
    pos.add(vel);
    
    //checks for boundary collisions
    if (pos.y + radius >= height) {
      pos.y = height - radius;      
      vel.y *= -1;
    } else if (pos.y <= radius) {
      pos.y = radius;
      vel.y *= -1;
    } //if
    if (pos.x + radius >= width) {
      pos.x = width - radius;
      vel.x *= -1;
    } else if (pos.x <= radius) {
      pos.x = radius;
      vel.x *= -1;
    } //if
    
    //check for object/ball collisions
    for (int i = 0; i < otherBalls.size(); i++) {
      PVector otherPos = otherBalls.get(i).pos;
      float distance = dist(pos.x, pos.y, otherPos.x, otherPos.y);
   
      if (distance != 0 && distance < radius) {
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
