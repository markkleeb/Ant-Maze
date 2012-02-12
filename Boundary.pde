class Boundary {
  
 
 float x;
 float y;
 float w;
 float h;
 
 Rectangle boundrect;
  
  
  Boundary(float x, float y, float w, float h){
 
 //define boundaries   
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   boundrect = new Rectangle(int(x), int(y), int(w), int(h));
   
    
  }
  
  void display(){
  //draw walls
   
    
    fill(0);
    stroke(0);
    rectMode(CENTER); 
    
    pushMatrix();
    translate(x,y);
     rect(0,0,boundrect.width,boundrect.height);
    popMatrix();  
  }
  
  
}
