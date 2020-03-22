
class Letter{
  
  RShape src;
  RPoint pos;
  color c1;
  color c2;
  int id;
  
  ParticleSystem ps;
  float activationLevel = 1.0;
  float minY, maxY;
  
  
  Letter( int id, RShape src, color c1, color c2 ){
    
    this.id = id;
    
    this.c1 = color( c1, 125 );
    this.c2 = color( c1, 10 );
    
    this.src = src;
    
   
    init();
    
  }
  
  void init(){
     
    RPoint center = src.getCentroid();
    ps = new ParticleSystem( new PVector(center.x, center.y) );
    
    println( id, src.getArea() );
    
    float ammount = map( src.getArea(), 1200, 22000, 90, 140 );
    
    while( ps.particles.size() < ammount ){
      
      RPoint topLeft = src.getTopLeft();
      RPoint bottomRight = src.getBottomRight();
      float x = random( topLeft.x, bottomRight.x );
      float y = random( topLeft.y, bottomRight.y );
      minY = topLeft.y;
      maxY = bottomRight.y;
      RPoint randomPos = new RPoint(x,y);
      
      if( src.contains( randomPos ) ){
        
        boolean collision = false;
        for(Particle part : ps.particles) {
          
          if( dist( x, y, part.position.x, part.position.y ) < 5.0 ){
           collision = true; 
          }
          
        }
        
        if( !collision ){
          ps.addParticle( x, y );
        }
        
        //println( x, y );
      }
      
      
      
    }
    
  }
  
  void update( float t ){
    
    for(Particle part : ps.particles) {
          
      if( map( part.position.y, minY, maxY, 0, 1 ) >= activationLevel ){
        part.active = true;
      }
          
    }
    
    ps.run();
    activationLevel -= 0.001;
    
  }
  
  
};
