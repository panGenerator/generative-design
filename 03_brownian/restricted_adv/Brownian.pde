
class Brownian{
  
  RShape src;
  RPoint pos;
  color c1;
  color c2;
  int id;
  
  Brownian( int id, RShape src, color c1, color c2 ){
    
    this.id = id;
    
    this.c1 = c1;
    this.c2 = c2;
    
    this.src = src;
    pos = new RPoint( src.getX(), src.getY() );
    
    while( !src.contains( pos ) ){
      pos.add( new RPoint( 1.0, 1.0 ) );
    }
    
    
  }
  
  void update( ){
    
    float ratio = 0.5;//map( pos.y, 0, dim.y, 0, 1 );
    color mix = lerpColor( c1, c2, ratio );
 
    stroke( mix );
  
    float jump = 15;
    //map( ratio, 0, 1, 5, 30 );
  
    RPoint newPos = new RPoint(pos.x+random(-jump,jump),pos.y+random(-jump,jump));
    
    if( !src.contains(newPos) ){
      newPos = new RPoint(pos.x+random(-jump,jump),pos.y+random(-jump,jump));
    }else{
      
      line(pos.x, pos.y, newPos.x, newPos.y);
      pos = newPos;
    }
      
    
    
    //!(brightness(src.get(floor(newPos.x), floor(newPos.y))) == 0)
  
    
    
    //println( id, " -> ", pos.x, pos.y, newPos.x, newPos.y );
    
  }
  
  
};
