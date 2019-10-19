

void setup(){
 size( 600, 600 ); 
}

void draw(){
  
  background(100);
  float cx = width / 2.0;
  float cy = height / 2.0;
  
  drawBlob( cx, cy, 250, 50, #27FAFF, 155.0, 10, 100 );
  drawBlob( cx, cy, 150, 20, #27FAFF, 155.0, 10, 300 );
  drawBlob( cx, cy, 80, 10,  #27FAFF, 155.0, 10, 400 );

}

void drawBlob( float px, float py, float maxRadius, float minRadius, color blobColor, float opacity, int resolution, int timeOffset ){
  
  float angleStep = TWO_PI / (resolution-1);
  float posX[] = new float[resolution];
  float posY[] = new float[resolution];
  
  for( int i = 0; i < resolution; i++){
    
    float angle = i * angleStep;
    posX[i] = sin( angle );
    posY[i] = cos( angle );
    
    float m = ( millis() + timeOffset ) / 1000.0;
    float n = noise( posX[i] + m/10.0, posY[i] + m/10.0, m );
    
    posX[i] = px + posX[i] * map(n,0,1,minRadius,maxRadius);
    posY[i] = py + posY[i] * map(n,0,1,minRadius,maxRadius);
    
    
  }
  
  beginShape();
  
  fill( blobColor, opacity );
  noStroke();
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
