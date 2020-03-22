
class Strand{
  
  RPoint startPt;
  RPoint pos;
  RShape src;
  float speed = 0;
  float maxY;
  
  color c1, c2;
  
  Strand( RPoint startPt, RShape src ){
     
    this.startPt = startPt;
    //startPt.x += random( -2, 2 );
    this.src = src;
    pos = startPt;
    speed = random( 0.1, 1 );
    maxY = startPt.y + random( 100, 200 );
    
    c1 = color( 0 );
    c2 = color( 0 );
    
  }
  
  
  void update(){
    
    float n = noise( pos.x, pos.y );
    float r = map( n, 0, 1, 0, 1 ); //map( pos.y, 0, height, 0, 5 );
    
    RPoint newPos = new RPoint(pos.x + random( -r, r ), pos.y + speed);
    
    if( pos.y < maxY && !src.contains(newPos) ){
      
      color mix = lerpColor( c1, c2, pos.y / maxY );
      
      float sw = map( pos.y, startPt.y, maxY, 1, 5 );
      
      strokeWeight( sw );
      stroke( mix, 150 * (1-(pos.y / maxY)) );
      line(pos.x, pos.y, newPos.x, newPos.y);
      pos = newPos;
    }
    
    
  }
  
}
