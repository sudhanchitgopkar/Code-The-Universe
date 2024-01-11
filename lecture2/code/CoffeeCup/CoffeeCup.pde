float numPoints = 200;
float r = 400;
int multVal = 2;

void setup () {
  frameRate(2);
  fullScreen();
  
  stroke(255);
} //setup

void draw() {
  background(0);
  translate(width/2, height/2);
  
  for (int i = 0; i < numPoints; i++) {
    line(r * cos(i/numPoints * TWO_PI), r * sin(i/numPoints * TWO_PI),
        r * cos(multVal * i/numPoints % numPoints * TWO_PI),
        r * sin(multVal * i/numPoints % numPoints * TWO_PI));
  } //for
  
  multVal++;
} //draw
