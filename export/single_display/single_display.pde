import processing.pdf.*;

boolean record;

void setup() {
  size(400, 400);
}

void draw() {
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame-####.pdf"); 
  }

  // Draw something good here
  background(255);
  line(mouseX, mouseY, width/2, height/2);

  if (record) {
    endRecord();
  record = false;
  }
}

// Use a keypress so thousands of files aren't created
void mousePressed() {
  record = true;
}
