PImage bg;

int step = 10;
void setup() {
  size(400, 300);
  bg = loadImage("gradient.png");
}
void draw() {
  fill(0);
  noStroke();
  background(255);
  for (int x=step; x<=width-step;x+=step)
  {
    for (int y=step; y<=height-step;y+=step)
    {
      float b = brightness(bg.get(x,y));
      
      float d = map(b, 0, 255, 8, 0); 
      ellipse(x, y, d, d);
    }
  }
}
