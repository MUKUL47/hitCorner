int x, y, randDir;
PImage locDoc;
void setup(){
size(750,600);
locDoc = loadImage("locDoc.jpg");
getRandPos();
randDir = round(random(0,3));
}
void draw(){
  background(255);  
  getRandDirectionToMove(randDir);
  image(locDoc,x,y,70,70);
  int whereExactly = checkIfHitBoundary();
  if( whereExactly > -1 ){ randDir = whereExactly; }
}
void getRandPos(){
  x = round(random(70,width-70));
  y = round(random(70,height-70));    
}
void getRandDirectionToMove(int pos){
  switch(pos){
    case 0 : x+=5; y-=5; //NE
    break;
    
    case 1 : x-=5; y-=5; //NW
    break;
    
    case 2 : x+=5; y+=5; //SE
    break;
    
    case 3 : x-=5; y+=5; //SW
    break;   
        
  }
}
int checkIfHitBoundary(){
 if     ( x >= width-70 && randDir == 2 ) return 3;  //RIGHT
 else if( x >= width-70 && randDir == 0 ) return 1;
 
 else if( x <= 0 && randDir == 1 ) return 0;  //LEFT
 else if( x <= 0 && randDir == 3 ) return 2;
 
 else if( y >= height-70 && randDir == 2 ) return 0; //BOTTOM
 else if( y >= height-70 && randDir == 3 ) return 1;
 
 else if( y <= 0 && randDir == 1 ) return 3;  //TOP
 else if( y <= 0 && randDir == 0 ) return 2;
 
 return -1; 
}
