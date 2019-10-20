import processing.pdf.*;
import java.util.Date;

int fileNumber = 0;

void setup() {
  size(400, 400);
  beginRecord(PDF, "ev-0000.pdf");
}

void draw() {
  // Be sure not to call background, otherwise your file
  // will just accumulate lots of mess, only to become invisible

  // Draw something good here
  line(mouseX, mouseY, width/2, height/2);
  
  float x = 10;
  
  if( x > 5 ){
   println( "x jest wieksze od 5"); 
  }
  
  if( x < 20 ){
   println( "x jest mniejsze od 20"); 
  }
  
  if( x >= 10 ){
   println( "x jest wieksze lub rowne 10"); 
  }
  
  if( x <= 10 ){
   println( "x jest mniejsze lub rowne 10"); 
  }
  
  if( x == 10 ){
   println( "x jest dokładnie rowne 10"); 
  }
  
  if( x != 10 ){
   println( "x nie jest równe 10"); 
  }
  
  
  
  
}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
  if (key != 'q') {
    endRecord();
    
    Date d = new Date();
    beginRecord(PDF, "ev-" + d.getTime() + ".pdf" );
    
    println("zapisano");
  }
}
