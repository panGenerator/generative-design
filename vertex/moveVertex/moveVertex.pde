PShape s;
boolean style = true;
void setup() {
  size(450, 450);
  s = loadShape("circle.svg");
}

void draw() {
  background(250);
  translate(100, 100);
  noStroke();
  beginShape();
  fill(200,10,10);
  PShape ss = s.getChild(0);
  for (int i = 0; i < ss.getVertexCount(); i++) {
    PVector v = ss.getVertex(i);
    if(v.y>125){
    v.x += sin((v.y)/(10+mouseY/10.0)+frameCount/10.0)*mouseX/10.0;
    }
    vertex(v.x, v.y);
  }
  endShape(CLOSE);
}
void mousePressed() {
  if (style) {
    s.disableStyle();
    style = false;
  } else {
    s.enableStyle();
    style = true;
  }
}
