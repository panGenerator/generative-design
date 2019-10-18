import controlP5.*;
ControlP5 cp5;

int v0r = 50; 
int v1r = 50;
int v2r = 50;
int v3r = 80;
int v4r = 130;
int v5r = 50;

color c1 = #ff00cc;
color c2 = #11c0c0;

void setup(){
  size(400, 400);
  cp5 = new ControlP5(this);
  cp5.addSlider("v0r", 10, 300).linebreak();
  cp5.addSlider("v1r", 10, 300).linebreak();
  cp5.addSlider("v2r", 10, 300).linebreak();
  cp5.addSlider("v3r", 10, 300).linebreak();
  cp5.addSlider("v4r", 10, 300).linebreak();
  cp5.addSlider("v5r", 10, 300).linebreak();
  
}

void draw() {
  background(255);
 
  //noStroke();
  PVector c = new PVector(width/2.0, height/2.0);
  
  fill(lerpColor(c1, c2, 0.15));
  PVector a = pos(c, 0,v0r);
  PVector b = pos(c, PI/3.0, v1r);
  triangle(c.x, c.y, a.x,a.y, b.x, b.y );
  
  fill(lerpColor(c1, c2, 0.3));
  a = pos(c, PI/3.0,v1r);
  b = pos(c, 2.0*PI/3.0, v2r);
  triangle(c.x, c.y, a.x,a.y, b.x, b.y );
  
  fill(lerpColor(c1, c2, 0.45));
  a = pos(c, 2.0*PI/3.0,v2r);
  b = pos(c, PI, v3r);
  triangle(c.x, c.y, a.x,a.y, b.x, b.y );
  
  fill(lerpColor(c1, c2, 0.6));
  a = pos(c, PI,v3r);
  b = pos(c, 4.0*PI/3.0, v4r);
  triangle(c.x, c.y, a.x,a.y, b.x, b.y );
  
  fill(lerpColor(c1, c2, 0.75));
  a = pos(c, 4.0*PI/3.0,v4r);
  b = pos(c, 5.0*PI/3.0, v5r);
  triangle(c.x, c.y, a.x,a.y, b.x, b.y );
  
  fill(lerpColor(c1, c2, 0.9));
  a = pos(c, 5.0*PI/3.0, v5r);
  b = pos(c, 0,v0r);
  triangle(c.x, c.y, a.x,a.y, b.x, b.y );
}

PVector pos(PVector center, float angle, float radius){
  return new PVector(center.x + cos(angle)*radius, center.y + sin(angle)*radius);
}
