PShape s;
int resolution = 10;
float minRadius = 50;
float maxRadius = 250;

void setup(){
 size( 600, 600 ); 
}

void draw(){
  
  background(100);
  
  float angleStep = TWO_PI / (resolution-1);
  float posX[] = new float[resolution];
  float posY[] = new float[resolution];
  
  for( int i = 0; i < resolution; i++){
    
    float angle = i * angleStep;
    posX[i] = width/2.0 + sin( angle ) * 200;
    posY[i] = height/2.0 + cos( angle ) * 200;
    
  }
  
  beginShape();
  fill( 255 );
  
  drawClosedCrv( posX, posY);
  
  endShape();
  
}

void drawClosedCrv( float px[], float py[] ){
 
  for( int i = 0; i < px.length; i++){
    curveVertex( px[i], py[i] ); 
  }
  
  curveVertex( px[1], py[1] );
  curveVertex( px[2], py[2] );
  
}
