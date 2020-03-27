
class AnimLine {
 
 RPoint start;
 RPoint end;
 ArrayList<RPoint> points;
 float timeOffset;
 float speed;
  
 AnimLine( RPoint start, RPoint end  ){
   
   this.start = start;
   this.end = end;
   
   timeOffset = random( 0, 100 );
   speed = random( 0.5, 4 );
   
   points = new ArrayList<RPoint>();
   
   for( float i = 0; i < 1.0; i += 0.1 ){
     
     float px = map( i, 0, 1, end.x, start.x );
     RPoint pt = new RPoint( px, start.y );
     points.add( pt );
     
   }
   
 }
 
 void update( float t ){
   
   RPoint s = points.get(0);
   s.y += sin( (t + timeOffset) / 100.0 ) * 2;
   //s.x += speed;
   
   stroke( 0 );
   beginShape();
   for( int i = 0; i < points.size(); i ++ ){
     
     RPoint p = points.get( i );
     
     if( i < points.size() - 1 ){
       points.get( i+1 ).y += (p.y - points.get( i+1 ).y) * 0.15;
       //points.get( i+1 ).x += (p.x - points.get( i+1 ).x) * 0.15;
     }
     
     vertex( p.x, p.y );
     
     
   }
   endShape();
   
 }
 
 
  
}
