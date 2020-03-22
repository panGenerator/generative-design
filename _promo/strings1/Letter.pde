
class Letter{
  
  RShape src;
  RPoint pos;
  color c1;
  color c2;
  int id;
  
  ArrayList<Strand> strands;
  
  Letter( int id, RShape src, color c1, color c2 ){
    
    this.id = id;
    
    this.c1 = color( c1, 125 );
    this.c2 = color( c1, 10 );
    
    this.src = src;
    
    strands = new ArrayList<Strand>();
   
    init();
    
  }
  
  void init(){
   
    RPoint[][] pts = src.getPointsInPaths();
     
     for( int i = 0; i < pts.length; i++ ){
      
       for( int j = 0; j < pts[i].length; j++ ){
         
         RPoint p = pts[i][j];
         ellipse( p.x, p.y, 10, 10 );
         
         Strand s = new Strand( p, src );
         strands.add( s );
         
       }
       
     }
    
  }
  
  void update( ){
      
     for( int i = 0; i < strands.size(); i ++ ){
       
       Strand s = strands.get(i);
       s.update();
       
     }
    
  }
  
  
};
