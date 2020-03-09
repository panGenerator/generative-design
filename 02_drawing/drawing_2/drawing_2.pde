//int ileKolek = 5;

void setup() {
  size(800, 800);
  background(255);
}

void draw() {
  //background(255);
  noStroke();
  fill(0,127);
  //zrob to 5 razy:
  if (mousePressed) {
    float losowyX = random(width);
    float losowyY = random(height);
    for (int licznik = 0; licznik < 5; licznik = licznik + 1)
    {
      float odl = dist(pmouseX, pmouseY, mouseX, mouseY);
      
      float promien = random(10);
      float pozycjaX = mouseX+random(-odl, odl);
      float pozycjaY = mouseY+random(-odl, odl);
      float odl2 = dist(pozycjaX, pozycjaY, mouseX, mouseY);
      color c = lerpColor(#FF00F3, #FFF700, odl2/10.0);
      fill(c, 255-odl2);  
      stroke(0, 100);
      line(pozycjaX, pozycjaY, mouseX, mouseY);
      //noStroke();
      ellipse(pozycjaX, pozycjaY, promien, promien);
    }
  }
}
