class Bug {

  float w;
  float h;
  float theta;
  PVector pos;
  PVector vel = new PVector(5, 0);
  boolean vert = false;
  Rectangle bugrec;
  ArrayList<Leg> legs;


  Bug(float x, float y) {

    pos = new PVector(x, y);
    legs = new ArrayList<Leg>();
    w = 10;
    h = 10;

    //draw bug rectangle
    bugrec = new Rectangle(int(pos.x-25/2), int(pos.y-10/2), 25, 10);

    //generate legs for each bug
    
      legs.add(new Leg(pos.x, pos.y));
    legs.add(new Leg(pos.x+5, pos.y));
    legs.add(new Leg(pos.x-5, pos.y));

  }

  void display() {
    
  
    pushMatrix();
    translate(pos.x, pos.y);

    //check orientation
    if (vert) {
      rotate(PI/2);
    }
    else {
      rotate(0);
    }
    //draw ant
    fill(255, 100, 100);
    strokeWeight(1);
    noStroke();
    ellipse(0, 0, w, h);
    ellipse(-5, 0, w, h);
    ellipse(5, 0, w, h);
    for(Leg l:legs){

      l.display();
    }
    popMatrix();

 
     
  }

  void bounce() {

    //pick a random direction

    int n = int(random(0, 4));

    switch(n) {

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

//intersects another rectangle?

  boolean isHitting(Rectangle target) {

    return(bugrec.intersects(target));
  }



  void mov() {

//add velocity vector to position vector
    
    pos.add(vel);
    if (vert) {
    bugrec.x = int(pos.x-bugrec.width/2);
    bugrec.y = int(pos.y-bugrec.height/2);
   bugrec.width = 10;
   bugrec.height = 25;
    
    } else {
    bugrec.x = int(pos.x-bugrec.width/2);
    bugrec.y = int(pos.y-bugrec.height/2);
    bugrec.width = 25;  
    bugrec.height = 10;
      
    }
    //  vel.x = constrain(vel.x, -5, 5);
    // vel.y = constrain(vel.y, -5, 5);
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);

//check to see if hitting the sides

    if (pos.x == 0 || pos.x > width-10) {

      vel.x *= -1;
    }
    if (pos.y < 10 || pos.y > height-10) {
      vel.y *= -1;
    }
  }

//check to see if ant reaches goal

  boolean leave() {

   if(pos.x > 340 && pos.y > 260){
         return true;
      
    }
    return false;
  
}


}
