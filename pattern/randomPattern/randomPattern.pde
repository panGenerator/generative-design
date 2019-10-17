int count = 7;
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
  fill(0);
  noStroke();
  background(255);
  randomSeed(seed);
  for (int x=0; x<width;x+=step)
  {
    for (int y=0; y<height;y+=step)
    {
      fill(map(x,0,width, 0, 255));
      int idx = floor(random(1) * tiles.length);
      shape(tiles[idx], x, y);
    }
  }
}
void mousePressed() {
  seed = floor(random(10000.0)); 
}
