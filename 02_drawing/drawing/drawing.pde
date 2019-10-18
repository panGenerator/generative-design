void setup() {
  size(800, 800);
  noStroke();
  background(255);
}

void draw() {
  for (int i=0; i<5; i++) {
    fill(random(0, 100), 100);
    float d = random(6);
    ellipse(mouseX+random(-d, d), mouseY+random(-d, d), d, d);
  }
}
