import peasy.*;
float radius = 100;
ArrayList<PVector> points;
float angleA = random(0, TWO_PI);
float angleB = random(0, TWO_PI);
PeasyCam cam;

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 100);
  points = new ArrayList<PVector>();

  points.add( new PVector(
    int(radius*sin(angleA)*cos(angleB)), 
    int(radius*sin(angleA)*sin(angleB)), 
    int(radius*cos(angleA)))
    );
}

void draw() {
  background(255);
  noFill();
  stroke(0);
  PVector move = PVector.random3D();
  PVector p = points.get(points.size()-1).copy();
  p.normalize();
  p.mult(radius);
  p.add(move);
  p.limit(radius);
  
  points.add(p);

  for (int i=1; i<points.size(); i++) {
    PVector p1 = points.get(i-1);
    PVector p2 = points.get(i);
    line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
  }
}
