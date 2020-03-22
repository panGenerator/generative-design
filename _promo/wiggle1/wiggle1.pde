import geomerative.*;

PImage img;
RShape grp;
ArrayList<Letter> letters;

color c1 = #000000; //#00C5FF
color c2 = #03F9FF; //#FF0077 //#F56A0C

boolean record = false;
int f = 0;

void setup(){
  
  size(1080, 1080);
  
  img = loadImage("wdl1.png");
  
  letters = new ArrayList<Letter>();
  
  RG.init(this);
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(10);
  RG.ignoreStyles(true);
  grp = RG.loadShape("wdl1.svg");
  
  println( ">>>> " , grp.countChildren() );
  
  for(int i=0;i<grp.countChildren();i++){
    
    RShape letter = grp.children[i];
    Letter b = new Letter( i, letter, c1, c2 );
    letters.add( b );
    
  }
  
  //src = loadImage("wdl1.png");
  
  noFill();
  
  
  noiseDetail(3,0.5);
  
}

void draw() {
  
  background( 255 ); //
  
   if( record ){
   
     for( int i = 0; i < letters.size(); i++ ){
       
       Letter b = letters.get(i);
       b.update( f/3.0 );
       
     }
     
     
     saveFrame( "output-wiggle/wiggle1-f" + f + ".png" );
     println( "frame: ", f );
     f++;
     
   
   }
   
   //grp.draw();
   
   //println( "bu" );
   
   
}


void keyPressed(){
 if( key == 'r' ){
  record = true; 
 }
}
