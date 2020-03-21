import geomerative.*;

PImage src;
RShape grp;
ArrayList<Brownian> browns;

color c1 = #00C5FF;
color c2 = #FF0077;



void setup(){
  
  size(1080, 1080);
  
  browns = new ArrayList<Brownian>();
  
  RG.init(this);
  RG.setPolygonizer(RG.ADAPTATIVE);
  RG.ignoreStyles(true);
  grp = RG.loadShape("wdl1.svg");
  
  println( ">>>> " , grp.countChildren() );
  
  for(int i=0;i<grp.countChildren();i++){
    
    RShape letter = grp.children[i];
    Brownian b = new Brownian( i, letter, c1, c2 );
    browns.add( b );
    
  }
  
  //src = loadImage("wdl1.png");
  
  noFill();
  
}

void draw() {
  
   
   
   for( int i = 0; i < browns.size(); i++ ){
     
     Brownian b = browns.get(i);
     b.update();
     
     
   }
   
   grp.draw();
   
   //println( "bu" );
   
   
}
