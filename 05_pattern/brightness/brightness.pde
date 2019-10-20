import controlP5.*;
ControlP5 cp5;
float radius = 100;
PImage bg;

float step = 10;
void setup() {
  size(800, 600);
  bg = loadImage("gradient.png");
  cp5 = new ControlP5(this);
  
  cp5.addSlider("radius", 10, 200).linebreak();
  cp5.addSlider("step", 10, 200).linebreak();
}
void draw() {
  
  //background(255);
  //tint( 255, 100 );
  //image( bg, 0, 0 );
  
  fill(0,127);
  noStroke();
  background(255);
  for (float y=step; y<=height-step;y=y+step)
  {
    for (float x=step; x<=width-step;x=x+step)
    {
      float b = brightness(bg.get(floor(x/2),floor(y/2)));
 
      float d = map(b, 0, 255, radius, 0); 
      ellipse(x, y, d, d);
    }
  }
}
