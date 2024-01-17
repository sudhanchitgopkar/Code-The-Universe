class Boid {
  PVector pos, vel;
  ArrayList<Boid> boids;
  float flockDist; //how far the Boid can "see"
  
  public Boid(PVector initPos, ArrayList<Boid> boids) {
    this.pos = initPos;
    this.vel = PVector.random2D();
    this.boids = boids;
    
    flockDist = 50;
  } //Boid
  
  void display() {
    fill(map(pos.x, 0, width, 0, 255), 
         map(pos.y, 0, height, 0, 255), 
         255);
    circle(pos.x, pos.y, 10);
  } //display
  
  void flock() {
    //1. Figure out sep, ali, coh forces
    PVector s = sep(), a = ali(), c = coh();
    
    //2. Weight forces
    s.mult(1.0);
    a.mult(1.0);
    c.mult(1.0);
    
    //3. Apply forces to our vel
    vel.add(s);
    vel.add(a);
    vel.add(c);
    
    vel.limit(2);
    
    //4. Update our pos
    pos.add(vel);
    
    //don't let boids fly into the void
    if (pos.x < 0) pos.x = width - 1;
    else if (pos.x >= width) pos.x = 0;
  
    if (pos.y < 0) pos.y = height - 1;
    else if (pos.y >= height) pos.y = 0;
  } //flock
  
  PVector sep() {
    PVector sepForce = new PVector(0, 0);
    
    for (Boid b : boids) {
      if (inFlock(b)) {
        PVector oppDir = PVector.sub(pos, b.pos).normalize();
        //weight inversely to distance from our position
        oppDir.div(PVector.dist(pos, b.pos));
        sepForce.add(oppDir);
      } //if
    } //for
    
    return sepForce.normalize();
  } //sep
  
  PVector ali() {
    PVector aliForce = new PVector(0, 0);
    
    for (Boid b : boids) {
      if (inFlock(b)) {
        aliForce.add(b.vel);
      } //if
    } //for
    
    return aliForce.normalize();
  } //ali
  
  PVector coh() {
    PVector cohForce = new PVector(0, 0);
    int numInFlock = 0;
    
    for (Boid b : boids) {
      if (inFlock(b)) {
        numInFlock++;
        cohForce.add(b.pos);
      } //if
    } //for
    
    if(numInFlock > 0) cohForce.div(numInFlock);
    //subtract from our position to make vector point us towards center
    return cohForce.sub(pos).normalize();
  } //coh
  
  boolean inFlock(Boid b) {
    float dist = PVector.dist(pos, b.pos);
    return dist > 0 && dist <= flockDist;
  } //inFlock
  
} //Boid
