import java.util.Comparator;
import java.util.Arrays;

class Letter{
  
  RShape src;
  RPoint pos;
  color c1;
  color c2;
  int id;
  
  float activationLevel = 1.0;
  float minY, maxY;
  ArrayList<AnimLine> animLines;
  
  
  Letter( int id, RShape src, color c1, color c2 ){
    
    this.id = id;
    
    this.c1 = color( c1, 125 );
    this.c2 = color( c1, 10 );
    
    this.src = src;
    animLines = new ArrayList<AnimLine>();
   
    init();
    
  }
  
  void init(){
     
    RPoint topLeft = src.getTopLeft();
    RPoint bottomRight = src.getBottomRight();
    
    for( float i = 0; i < 1.0; i += 0.05 ){
      
      float py = map( i, 0, 1, topLeft.y - 3, bottomRight.y + 3 );
      RShape cuttingLine = RG.getLine(topLeft.x - 1, py , bottomRight.x + 1, py );
      
      RPoint[] pts = src.getIntersections(cuttingLine);
      
      if( pts != null && pts.length >= 2 && pts.length % 2 == 0 ){
        
        Arrays.sort(pts, new Comparator<RPoint>() {
            public int compare(RPoint a, RPoint b) {
              return Float.compare(a.x, b.x);
            }
        });
        
        for( int j = 0; j < pts.length; j+=2 ){
          
          if( pts[j+1] != null ){
            
            RPoint start = new RPoint(pts[j].x,  pts[j].y);
            RPoint end = new RPoint(pts[j+1].x,  pts[j+1].y);
            
            AnimLine al = new AnimLine( start, end );
            animLines.add( al );
            
            stroke( #FF0396 );
            line( pts[j].x,  pts[j].y, pts[j+1].x,  pts[j+1].y );
            
          }
         
        }
        
      }
      
      
    }
    
  }
  
  void update( float t ){
    
    //for( int i = 0; i < animLines.size(); i++ ){
      
    //  AnimLine al = animLines.get(i);
    //  al.update();
      
    //}
   
  }
  
  
};
