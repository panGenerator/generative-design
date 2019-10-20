import controlP5.*;
ControlP5 cp5;

int bgColor = 0;
//int fillColor = 100;
int r = 0;
int g = 0;
int b = 0;
boolean mode = false;
float radius = 100;
float roundness = 0.0;

void setup(){
  
  size(400, 400);
  cp5 = new ControlP5(this);
  
  cp5.addSlider("bgColor", 0, 255).linebreak();
  //cp5.addSlider("fillColor", 0, 255).linebreak();
  cp5.addSlider("r", 0, 255 ).linebreak();
  cp5.addSlider("g", 0, 255 ).linebreak();
  cp5.addSlider("b", 0, 255 ).linebreak();
  cp5.addSlider("roundness", 0, 500 ).linebreak();
  cp5.addSlider("radius", 50.0, 200.0).linebreak();
  
  rectMode( CENTER );
  
}

void draw() {
  background(bgColor);
  noStroke();
  fill(r,g,b);
  
 
  rect(200, 200, radius*2, radius*2, roundness );
  

  
}
