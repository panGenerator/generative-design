
class Letter{
  
  RShape src;
  RPoint pos;
  color c1;
  color c2;
  int id;
  
  
  Letter( int id, RShape src, color c1, color c2 ){
    
    this.id = id;
    
    this.c1 = color( c1, 125 );
    this.c2 = color( c1, 10 );
    
    this.src = src;
    
   
    init();
    
  }
  
  void init(){
   
    
    
  }
  
  void update( float t ){
      
     RPoint[][] pts = src.getPointsInPaths();
     
     for( int i = 0; i < pts.length; i++ ){
       
       beginShape();
       for( int j = 0; j < pts[i].length; j++ ){
         
         RPoint p = pts[i][j];
         float magnitude =  map( sin( t / 10.0 ), -1, 1, 0, 50 );
         float force = map( p.y, src.getY(), src.getBottomLeft().y, 0, 1 );
         //float cutoff = map( sin( millis() / 10000.0 ), -1, 1, 0, 1 );
         
         force = (force > 0.5 ) ? force : 0;
         
         float offset = sin( (p.y + t ) + id*1000 ) * force * magnitude;
         curveVertex( p.x + offset, p.y );
         
       }
       endShape(CLOSE);
       
     }
    
  }
  
  
};
