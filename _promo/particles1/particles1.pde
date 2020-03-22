import geomerative.*;

PImage img;
RShape grp;
ArrayList<Letter> letters;

color c1 = #000000; //#00C5FF
color c2 = #03F9FF; //#FF0077 //#F56A0C

boolean record = false;
int f = 0;

void setup(){
  
  size(1080, 1080, P3D );
  
  img = loadImage("wdl1.png");
  
  letters = new ArrayList<Letter>();
  
  RG.init(this);
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(10);
  RG.ignoreStyles(true);
  grp = RG.loadShape("wdl1.svg");
  
  //println( ">>>> " , grp.countChildren() );
  
  for(int i=0;i<grp.countChildren();i++){
    
    RShape letter = grp.children[i];
    Letter b = new Letter( i, letter, c1, c2 );
    letters.add( b );
    
  }
  
  //src = loadImage("wdl1.png");
  
  noStroke();
  
  
  noiseDetail(3,0.5);
  
}

void draw() {
  
  //background( 255 ); //
  fill( 255, 50 );
  rect( 0, 0, width, height );
  
   if( record ){
   
     for( int i = 0; i < letters.size(); i++ ){
       
       Letter l = letters.get(i);
       l.update( f/3.0 );
       
     }
     
     
     saveFrame( "output-particles1/particles1-f" + f + ".png" );
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
