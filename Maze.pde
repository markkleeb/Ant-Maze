import java.util.*;  
import java.awt.*;

ArrayList<Bug> bugs;
ArrayList<Boundary> boundaries;



void setup(){
 size(400, 300);
 smooth();
 
 bugs = new ArrayList<Bug>();
 boundaries = new ArrayList<Boundary>();

 rectMode(CENTER);
 fill(0);
 
 //build the maze! 
  boundaries.add(new Boundary(width/2+15, 5,width-50, 10));
  boundaries.add(new Boundary(width/2,height-5,width,10));
  boundaries.add(new Boundary(width-5,height/2-25,10,height-30));
  boundaries.add(new Boundary(5,height/2+15,10,height-50));
  boundaries.add(new Boundary(40, height/2-50, 5, height-200));
  boundaries.add(new Boundary(75, height/2-100, 5, height - 200));
  boundaries.add(new Boundary(137, height/2-2, 200, 5));
  boundaries.add(new Boundary(20, height/2+30, 100, 5));
  boundaries.add(new Boundary(110, height/2+45, 5, 100));
  boundaries.add(new Boundary(150, height/2+100, 5, 120));
  boundaries.add(new Boundary(77, height/2+93, 70, 5));
  boundaries.add(new Boundary(200, height/2+45, 5, 100));
  boundaries.add(new Boundary(100, 40, 50, 5));
  boundaries.add(new Boundary(120, 110, 5, 70));
  boundaries.add(new Boundary(167, 75, 100, 5));
  boundaries.add(new Boundary(160, 50, 5, 50));
  boundaries.add(new Boundary(200, 20, 5, 30));
  boundaries.add(new Boundary(240, 33, 80, 5));
  boundaries.add(new Boundary(250, 70, 5, 80));
  boundaries.add(new Boundary(186, 116, 50, 5));
  boundaries.add(new Boundary(215, 98, 5, 40));
  boundaries.add(new Boundary(350, 30, 5, 100));
  boundaries.add(new Boundary(315, 78, 70, 5));
  boundaries.add(new Boundary(300, 108, 100, 5));
  boundaries.add(new Boundary(340, 270, 5, 100));
  boundaries.add(new Boundary(340, 180, 160, 5));
  boundaries.add(new Boundary(340, 160, 5, 40));
  boundaries.add(new Boundary(293, 200, 5, 40));
  boundaries.add(new Boundary(310, 260, 60, 5));
  boundaries.add(new Boundary(240, 260, 5, 100));
  boundaries.add(new Boundary(280, 125, 5, 40));
  
}

void draw(){
 
 background(255);
 stroke(0, 255, 0);
 strokeWeight(2);
 line(280, 260, 400, 260);
text("GOAL", 350, 280);

 
 
 for (Boundary wall: boundaries){
   
   //draw maze walls
   
   wall.display(); 
 }
  
  for (Bug b: bugs){
   
   b.display();
  } 
   //Iterate through bugs
   
   for(Bug b: bugs){  
    //iterate through bugs again
    for(Bug a: bugs){
      

       //check to see if deflections happen
     if(b != a && b.isHitting(a.bugrec)){
      b.bounce();
     
    //  println("x = " + b.vel.x);
     // println("y = " +b.vel.y);
     }
    }
   
 }
 
  
  for(Boundary wall: boundaries){
   for(Bug b: bugs){
    if(b.isHitting(wall.boundrect)){
     b.bounce(); 
    }
     
   }
    
  }
  
  
 
 
 //bugs move every 10 frames
 if(frameCount%10 ==1){
    for(Bug b: bugs){
   b.mov();
  } 
 }
 
 //new bug every 160 frames
 if(frameCount%160 ==1){

  Bug p = new Bug(0, 15);
  bugs.add(p);
 
 }
 
 for(int i=0; i< bugs.size(); i++){
  
   Bug b = bugs.get(i);
   
  if(b.leave()){
   
    fill(0, 255, 0);
    rectMode(CORNER);
    rect(350, 260, 50, 40);
   bugs.remove(i);
    println("bye!");
  }
   
   
 }
 

 
  
}
