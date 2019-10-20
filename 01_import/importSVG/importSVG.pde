// CSS Properties: Style Attributes
PShape s;
boolean style = true;

void setup() {
  size(800, 600);
  s = loadShape("test.svg");
}

void draw() {
  background(204);
  shape(s, 0, 0);
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
