float numPoints = 5, r = 400;
PVector pos;
int prevVertex = -1;

void setup() {
  frameRate(1000);
  fullScreen();
  
  noStroke(); //no outline around circles
  fill(255);
  background(0);
  colorMode(HSB);
  
  pos = new PVector(0, 0); //this will be translated to screen center
} //setup

void draw() {
  translate(width/2, height/2);
  
  //1. randomly figure out the next vertex
  int nextVertex = int(random(numPoints));
  
  //1.5 make sure that the next vertex != prev vertex
  while(nextVertex == prevVertex) {
    nextVertex = int(random(numPoints));
  } //while
  prevVertex = nextVertex;
  
  //2. find the midpoint between our current point and the next vertex
  PVector nextVertexCoords = new PVector(r * cos(nextVertex/numPoints * TWO_PI),
                                         r * sin(nextVertex/numPoints * TWO_PI));
  pos = new PVector((pos.x + nextVertexCoords.x)/2, (pos.y + nextVertexCoords.y)/2);
  
  //hue is a function of distance from center of screen
  fill(map(dist(pos.x, pos.y, 0, 0), 0, height, 0, 255), 255, 255);

  //3. plot it!
  circle(pos.x, pos.y, 2);
} //draw
