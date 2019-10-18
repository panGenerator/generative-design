PImage bg;

int step = 10;
int r = 5;
void setup() {
  size(400, 300);
  bg = loadImage("gradient.png");
}
void draw() {
  noFill();
  background(255);
  stroke(50);
  for (int x=step; x<=width-step;x+=step)
  {
    for (int y=step; y<=height-step;y+=step)
    {
      float b = brightness(bg.get(x,y));
      
      float a = map(b, 0, 255, 0, TWO_PI); 
      PVector p1 = new PVector(x+r*cos(a), y+r*sin(a));
      PVector p2 = new PVector(x+r*cos(a+PI), y+r*sin(a+PI));
      line(p1.x, p1.y, p2.x, p2.y);
    }
  }
}
