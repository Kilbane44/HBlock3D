class Orb
{
  PVector pos;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  color c;
  
  Orb()
  {
    pos = new PVector(random(500),random(500),random(500)); 
    velocity = new PVector(0, 0,0);
    topspeed = random(12, 20);
    c = color(random(360), 255, 255);
  }
  
  void Render()
  {
 
    PVector tar;
    PVector dir;
    tar = manPos.copy();
    tar.y-=80;
    dir = PVector.sub(tar, pos);
    
  
    
    dir.normalize();
    //dir.mult(3.5);

    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(topspeed);

    pos.add(velocity);
    
    
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    sphere(20);
    popMatrix();
    
  }
  
  
  
}