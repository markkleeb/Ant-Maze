class Boundary {
  
 
 float x;
 float y;
 float w;
 float h;
 Rectangle boundrect;
  
  
  Boundary(float x, float y, float w, float h){
    
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   boundrect = new Rectangle(int(x), int(y), int(w), int(h));
   
    
  }
  
  void display(){
   
    fill(0);
    stroke(0);
    rectMode(CENTER); 
    
    pushMatrix();
    translate(x,y);
     rect(0,0,w,h);
     boundrect.x = 0;
     boundrect.y = 0;
    popMatrix();  
  }
  
  
}
