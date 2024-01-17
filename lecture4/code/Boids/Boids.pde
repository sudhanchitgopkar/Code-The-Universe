ArrayList<Boid> boids;
int numBoids;

void setup() {
  fullScreen();
  
  numBoids = 100;
  boids = new ArrayList <> ();
  
  for (int i = 0; i < numBoids; i++) {
    boids.add(new Boid(new PVector(random(width), random(height)), boids));
  } //for
  
} //setup

void draw() {
  background(0);
  for (Boid b : boids) {
    b.flock();
    b.display();
  } //for
} //draw
