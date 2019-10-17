// CSS Properties: Style Attributes
PShape s;
boolean style = true;
void setup() {
  size(300, 300);
  s = loadShape("shroom.svg");
}

void draw() {
  background(204);
  shape(s, 100, 100);
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
