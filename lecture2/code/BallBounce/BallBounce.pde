ArrayList<Ball> balls;
int numBalls = 10;

void setup() {
  fullScreen();
  colorMode(HSB); 
  
  balls = new ArrayList <> ();
  
  //initialize list with balls
  for (int i = 0; i < numBalls; i++) {
    balls.add(new Ball(random(width), random(height)));
  } //for
  
  //for each ball, update with data of other balls
  for (int i = 0; i < numBalls; i++) {
    balls.get(i).setBalls(balls);
  } //for
} //setup

void draw() {
  background(0);
  
  for (Ball b : balls) {
    b.move();
    b.display();
  } //for
} //draw

void mousePressed() {
  PVector mousePos = new PVector(mouseX, mouseY);
  
  //new vel vector points towards mouse position when pressed
  balls.get(0).vel = mousePos.sub(balls.get(0).pos);
  
  //always set to 4 to ensure magnitude stays reasonable
  balls.get(0).vel.setMag(4);
} //mousePressed
