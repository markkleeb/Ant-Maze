class Bug{
  
  int c = color(random(0,255), random(0,255), random(0,255));
 float w;
 float h;
 PVector pos;
 PVector vel = new PVector(5,0);
 boolean vert = false;
Rectangle bugrec;
ArrayList<Leg> legs;
  
  
  Bug(float x, float y){
   
    pos = new PVector(x, y);
   legs = new ArrayList<Leg>();
   w = 10;
   h = w;
   
   bugrec = new Rectangle(int(pos.x), int(pos.y), 25, 10);
    
    legs.add(new Leg(pos.x, pos.y));
   legs.add(new Leg(pos.x+5, pos.y));
  legs.add(new Leg(pos.x-5, pos.y)); 
    
  }
  
  void display() {
   
   ellipseMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
   
   if(vert){
    rotate(PI/2);
   }
   else{
     rotate(0);
   }
    fill(c);
    strokeWeight(1);
    noStroke();
    ellipse(0,0,w,h);
    ellipse(-5,0, w, h);
    ellipse(5, 0, w,h);
    popMatrix();
    
  }
  
  void bounce(){
      
    
   int n = int(random(0,4));
   
   switch(n){
    
    case 0:
    
    vel.x = 5;
    vel.y = 0;
    vert = false;
    
    break;
    
    case 1:
    
    vel.x = -5;
    vel.y = 0;
    vert = false;
    
    
    break;
    
    case 2:
    
    vel.x = 0;
    vel.y = 5;
    vert = true;
    
    
    break;
    
    case 3:
    
    vel.x = 0;
    vel.y = -5;
    
    vert = true;
    
    break;
     
   }
   
   pos.add(vel);
   pos.x= constrain(pos.x, 0, width);
   pos.y = constrain(pos.y, 0, height);
  
  }
  
  boolean isHitting(Rectangle target){
    
    return(bugrec.intersects(target));
    
  }
   

  
  void mov(){
   
    
    pos.add(vel);
    bugrec.x += vel.x;
    bugrec.y += vel.y;
  //  vel.x = constrain(vel.x, -5, 5);
   // vel.y = constrain(vel.y, -5, 5);
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
  
  if(pos.x == 0 || pos.x > width-10){
   
    vel.x *= -1;
    
  }
  if(pos.y < 10 || pos.y > height-10){
   vel.y *= -1;
    
  }
  
    
  }
  
  
  boolean leave(){
   
   if(pos.x > width){
    
     return true;
     
   }
   return false;
    
  }
  
  
}
