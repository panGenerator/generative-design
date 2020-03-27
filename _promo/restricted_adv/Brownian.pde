
class Brownian{
  
  RShape src;
  RPoint pos;
  color c1;
  color c2;
  int id;
  
  Brownian( int id, RShape src, color c1, color c2 ){
    
    this.id = id;
    
    this.c1 = color( c1, 125 );
    this.c2 = color( c1, 10 );
    
    this.src = src;
    pos = new RPoint( src.getX(), src.getY() );
    
    while( !src.contains( pos ) ){
      pos.add( new RPoint( 1.0, 1.0 ) );
    }
    
    
  }
  
  void update( ){
    
    float ratio = map( pos.y, src.getY(), src.getBottomLeft().y , 0, 1 );
    color mix = lerpColor( c1, c2, ratio );
 
    stroke( mix );
  
    float jump = random( 10, 40 );
    strokeWeight( 1 ); //random( 1, 5 ) //map( ratio, 0, 1, 1, 5 )
    //map( ratio, 0, 1, 5, 30 );
  
    RPoint newPos = new RPoint(pos.x+random(-jump,jump),pos.y+random(-jump,jump));
    
    if( !src.contains(newPos) ){
      
      newPos = new RPoint(pos.x+random(-jump,jump),pos.y+random(-jump,jump));
      
    }else{
      
      line(pos.x, pos.y, newPos.x, newPos.y);
      pos = newPos;
      
    }
      
    if( random( 0, 1 ) > 0.995 ){
      float s = random( 3, 25 );
      //noStroke();
      fill( 255 );
      ellipse( pos.x, pos.y, s, s );
    }
    
    //!(brightness(src.get(floor(newPos.x), floor(newPos.y))) == 0)
  
    
    
    //println( id, " -> ", pos.x, pos.y, newPos.x, newPos.y );
    
  }
  
  
};
