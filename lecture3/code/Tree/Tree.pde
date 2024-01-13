float angle = PI/8;

void setup() {
  fullScreen();
  colorMode(HSB);
} //setup


void draw() {
  background(140, 20, 255);
  
  translate(width/2, height);
  angle = map(mouseX, -width/2, width/2, 0, TWO_PI);
  
  branch(300);
} //draw

void branch(float len) {
  //if branches are too small to see anymore
  if (len < 2) return;
  
  //taller branches get greener and thinner
  strokeWeight(map(len, 2, 300, 0.5, 3)); 
  stroke(100, map(len, 2, 300, 255, 0), 100);
  
  line(0,0,0,-len);
  translate(0,-len);
  
  //recursively make first branch
  pushMatrix();
  rotate(angle);
  branch(len * 2/3);
  popMatrix();
  
  //then second branch
  pushMatrix();
  rotate(-angle);
  branch(len * 2/3);
  popMatrix();
} //branch
