// CSS Properties: Style Attributes
PShape s;
void setup() {
  size(800, 800);
  s = loadShape("shape.svg");
  s.disableStyle();
}

void draw() {
  background(204);
  noFill();
  //shape(s, 100, 100);
  // println(getTotalLength(s.getChild(0)));
  int r = 5;
  noFill();
  stroke(0);
  for(float a=0;a<=1;a+=0.01){
    PVector p = getPoint(s.getChild(0), a);
    ellipse(p.x+100, p.y+100, r*2, r*2);
    r = (r+1)%30;
  }
}

PVector getPoint(PShape shape, float amt) {

  PVector p1 = new PVector();
  PVector p2 = new PVector();
  float amtAtP1=0;
  float amtAtP2=0;
  int i = 1;
  for (; i<shape.getVertexCount(); i++) {

    p1 = shape.getVertex(i-1);
    p2 = shape.getVertex(i);
    amtAtP1 = getLengthAtPoint(shape, i-1)/getTotalLength(shape);
    amtAtP2 = getLengthAtPoint(shape, i)/getTotalLength(shape);
    if (amtAtP2>amt) {
      break;
    }
  }
  if (getLengthAtPoint(shape, i-1)/getTotalLength(shape)==amt) {
    return p1;
  } else if (getLengthAtPoint(shape, i)/getTotalLength(shape)==amt){
   return p2; 
  } else {
    float a = map(amt, amtAtP1, amtAtP2, 0, 1);
    return new PVector(lerp(p1.x, p2.x, a), lerp(p1.y, p2.y, a));   
  }
}
float getTotalLength(PShape shape) {
  float lngth = 0;
  for (int i=1; i<shape.getVertexCount(); i++) {
    PVector p1 = shape.getVertex(i-1); 
    PVector p2 = shape.getVertex(i);
    lngth+=dist(p1.x, p1.y, p2.x, p2.y);
  }
  return lngth;
}
float getLengthAtPoint(PShape shape, int idx) {
  float lngth = 0;
  if (idx > shape.getVertexCount()-1) {
    return -1;
  }
  for (int i=1; i<=idx; i++) {
    PVector p1 = shape.getVertex(i-1); 
    PVector p2 = shape.getVertex(i);
    lngth+=dist(p1.x, p1.y, p2.x, p2.y);
  }
  return lngth;
}
