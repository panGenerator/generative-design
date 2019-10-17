import processing.pdf.*;

void setup() {
  size(400, 400);
  beginRecord(PDF, "everything.pdf");
}

void draw() {
  // Be sure not to call background, otherwise your file
  // will just accumulate lots of mess, only to become invisible
   
  // Draw something good here
  line(mouseX, mouseY, width/2, height/2);
}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
