ArrayList<Walker> walkers;

void setup() {
  frameRate(1000);
  size(500,500);
  
  walkers = new ArrayList<> ();
  //picture must be in the same folder as sketch
  PImage john = loadImage("jh.jpg");
  image(john, 0, 0);
  
  //loads pictures of John Harvard picture into pixels array
  loadPixels(); 
  
  //clears John Harvard picture
  background(255);
  
  //make 100 random walkers
  for (int i = 0; i < 100; i++) {
    walkers.add(new Walker(int(random(width)), int(random(height))));
  } //for
} 

void draw() {
  for (Walker walker : walkers) {
    walker.move();
    walker.display();
  } //for
} 
