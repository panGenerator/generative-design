import controlP5.*;
ControlP5 cp5;

int bgColor = 0;
int fillColor = 100;
int radius = 100;

void setup(){
  size(400, 400);
  cp5 = new ControlP5(this);
  cp5.addSlider("bgColor", 0, 255).linebreak();
  cp5.addSlider("fillColor", 0, 255).linebreak();
  cp5.addSlider("radius", 50, 200).linebreak();
}

void draw() {
  background(bgColor);
  noStroke();
  fill(fillColor);
  ellipse(200, 200, radius*2, radius*2);
  
}
