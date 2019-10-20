void setup() {
  size(800, 800);
  noStroke();
  background(255);
}

void draw() {
  
  if (mousePressed) {
    
    float d = dist( pmouseX, pmouseY, mouseX, mouseY );
    float spread = map( d, 0, 30, 0, 20 );
    
    for (int i=0; i<5; i++) {
      fill(random(0, 100), 100);
      float s = random(10);
      float m = random(spread);
      ellipse(mouseX+random(-m, m), mouseY+random(-m, m), s, s);
    }
    
  }
}
