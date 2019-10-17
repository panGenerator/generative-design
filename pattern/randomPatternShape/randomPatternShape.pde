int count = 4;
PShape[] tiles = new PShape[count];
int step = 50;
int seed = 0;
PVector[] positions = new PVector[10];

void setup() {
  size(600, 400);
  frameRate(5);
  for (int i=0; i<count; i++) {
    tiles[i] = loadShape(i+".svg"); 
    tiles[i].disableStyle();
  }
  positions[0] = new PVector(100, 100);
  positions[1] = new PVector(150, 100);
  positions[2] = new PVector(200, 100);
  positions[3] = new PVector(100, 150);
  positions[4] = new PVector(100, 250);
  positions[5] = new PVector(150, 200);
  positions[6] = new PVector(200, 150);
  positions[7] = new PVector(200, 200);
  positions[8] = new PVector(100, 200);
  positions[9] = new PVector(200, 250);
}
void draw() {
  fill(0);
  noStroke();
  background(255);
  //randomSeed(seed);
  for (int i=0; i<positions.length; i++)
  {
    int idx = floor(random(1) * tiles.length);
    pushMatrix();
    translate(positions[i].x+step/2.0, positions[i].y+step/2.0);
    rotate(random(TWO_PI));
    scale(random(0.2, 0.8));
    translate(-positions[i].x-step/2.0, -positions[i].y-step/2.0);
    shape(tiles[idx], positions[i].x, positions[i].y);
    popMatrix();
  }
}
void mousePressed() {
  seed = floor(random(10000.0));
}
