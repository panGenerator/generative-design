int count = 4;
PShape[] tiles = new PShape[count];
int step = 50;
int seed = 0;

void setup() {
  size(600, 400);
  for(int i=0;i<count; i++){
    tiles[i] = loadShape(i+".svg"); 
    tiles[i].disableStyle();
  }
}
void draw() {
  noFill();
  strokeWeight(1.5);
  background(255);
  randomSeed(seed);
  for (int x=0; x<width;x+=step)
  {
    for (int y=0; y<height;y+=step)
    {
      
      stroke(map(x,0,width, 100, 200), map(y, 0, height, 50, 250),0);
      int idx = floor(random(1) * tiles.length);
      shape(tiles[idx], x, y);
    }
  }
}
void mousePressed() {
  seed = floor(random(10000.0)); 
}
