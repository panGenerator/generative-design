PImage a;
PVector pos;
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
  PVector newPos = new PVector(pos.x+random(-5,5),pos.y+random(-5,5));
  while(!(brightness(a.get(floor(newPos.x), floor(newPos.y))) == 0)){
    newPos = new PVector(pos.x+random(-5,5),pos.y+random(-5,5));
  }
   line(pos.x, pos.y, newPos.x, newPos.y);
   pos = newPos;
}
