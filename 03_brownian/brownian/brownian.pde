PVector pos;
void setup(){
  size(800, 800);
  pos = new PVector(width/2.0, height/2.0);
}

void draw() {
   PVector newPos = new PVector(pos.x+random(-5,5),pos.y+random(-5,5));
   line(pos.x, pos.y, newPos.x, newPos.y);
   pos = newPos;
}
