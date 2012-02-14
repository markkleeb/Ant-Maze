class Leg{
  
  PVector pos;
  float anglevel=0.1;
  float angle;
  
 
 Leg(float x, float y){
   
   pos = new PVector(x,y);
   
   
 }
 
 void display(){
   
  
   stroke(0);
   pushMatrix();
  translate(pos.x, pos.y-20);
  rotate(angle);
  line(0, 5, 0, 10);
  popMatrix();
  pushMatrix();
  translate(pos.x, pos.y-20);
  rotate(-angle);
  line(0, -5, 0, -10);
  popMatrix();
  
  angle += anglevel;
  
  
  if(angle > 0.5  || angle < -0.5){
    anglevel *= -1;
}

}
}
