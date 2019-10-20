PImage a;
PVector pos;

color c1 = #00C5FF;
color c2 = #FF0077;

float jump = 20;

void setup(){
  size(400, 400);
  stroke(0, 100);
  pos = new PVector(random(width), random(height));
  a = loadImage("a.png");
  while(!(brightness(a.get(floor(pos.x), floor(pos.y))) == 0)){
    pos = new PVector(random(width), random(height));
  }
  
}

void draw() {
  
  float ratio = map( pos.y, 0, height, 0, 1 );
  color mix = lerpColor( c1, c2, ratio );
  //strokeWeight( 5 * ratio );
  stroke( mix );
  
  jump = map( ratio, 0, 1, 5, 30 );
  
  PVector newPos = new PVector(pos.x+random(-jump,jump),pos.y+random(-jump,jump));
  while(!(brightness(a.get(floor(newPos.x), floor(newPos.y))) == 0)){
    newPos = new PVector(pos.x+random(-jump,jump),pos.y+random(-jump,jump));
  }
  
  
  
  line(pos.x, pos.y, newPos.x, newPos.y);
  pos = newPos;
}
