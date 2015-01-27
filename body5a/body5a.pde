
PImage img;

int w,h;
String yesh = "יש";
String ein  = "אין";

int size = 7;

Particle[] parts = new Particle[300];
PVector O = new PVector();

PGraphics pLayer;
PGraphics bodyLayer;


void setup(){
   size(1024,768, P3D);
   pLayer = createGraphics(width, height, P3D);
   bodyLayer = createGraphics(width, height, P3D);
   w = width/2;
   h = height/2;
   background(255);
   img = loadImage("body5.png");
   img.resize(w,h);
   imageMode(CENTER);
//   image(img, width/2, height/2);
   
   for( int i = 0; i < parts.length; i++ )
  {
    parts[i] = new Particle();
  }
  noStroke();
  smooth();
//  fill( 0 );


}

void draw(){
  background(255);
  bodyLayer.beginDraw();
  img.resize(w,h);
  bodyLayer.tint(255,255);
  bodyLayer.imageMode(CENTER);
  bodyLayer.image(img, width/2, height/2);
  bodyLayer.endDraw();    
  
  pLayer.beginDraw();
  
  pLayer.background( 255,0 );
  O.set( mouseX, mouseY, -500 );
//  pLayer.lights();
  for( int i = 0; i < parts.length; i++ )
  {
    parts[i].update();
  }
    
   pLayer.endDraw(); 
  imageMode(CENTER); 
   image(bodyLayer,width/2,height/2); 
   image(pLayer,width/2,height/2); 
}



void incSize(){
      float sizeF = size * 1.2;
      size = int (sizeF) ;
      if (size >= 20){
        size = 20;
      }
}

void decSize(){
      float sizeF = size * 0.8;
      size = int (sizeF) ;
      if (size <= 7){
        size = 7;
      }
}


void keyPressed(){
   if (key=='m'){
      w = int(w * 1.1); 
      h = int(h * 1.1);
      if (w < width * 3){
        incSize();
      }
      else{
        decSize();  
      }
   }
  if (key=='n'){
      w = int(w * 0.9); 
      h = int(h * 0.9);
      if (w > width / 3){
        decSize();
      }
      else{
        incSize();  
      }
 } 
}
