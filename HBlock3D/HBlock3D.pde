import queasycam.*;
QueasyCam cam;

PShape tree;
PShape man;
PImage grass;

PVector manPos = new PVector(20, 20, 100);

float manDeg = 0;

Orb o;
int ORB_COUNT = 100;
ArrayList<Orb> orbs = new ArrayList<Orb>();

void setup()
{
  size(800, 800, P3D);
  cam = new QueasyCam(this);
  tree = loadShape("Tree/tinker.obj");
  man = loadShape("Man/tinker.obj");
  grass = loadImage("grass.jpeg");

  o = new Orb();

  for (int i=0; i < ORB_COUNT; i++)
  {
    orbs.add(new Orb());
  }
}




void draw()
{
  background(0);

  o.Render();

  if (keyPressed)
  {
    if (key == ' ')
    {
      pointLight(255, 255, 255, manPos.x, manPos.y-80, manPos.z);
    }
    
    //Un Comment to show orbs
    //for(Orb ob: orbs)
    //{
    //  ob.Render();
    //}
  }

  
  DrawAxis();
  
  
  
  //pushMatrix()
  //translate
  //rotate
  //render
  //pop

  pushMatrix();
  translate(0, 40, 0);
  rotateX(PI/2);
  image(grass, 0, 0);
  popMatrix();



  pushMatrix();
  translate(30, 30, 100);
  //sphere(100);
  rotateX(PI/2);
  shape(tree);

  popMatrix();


  PVector pos = cam.position;
  pos = pos.copy();

  pushMatrix();
  translate(manPos.x, manPos.y, manPos.z);
  rotateY(manDeg);
  rotateX(PI/2);

  shape(man);
  popMatrix();

// When the mousr is pressed move the man object along the X and change rotation value
  if (mousePressed)
  {
    if (mouseButton == LEFT)
    {
      manPos.x+= 3;
      manDeg += PI/6;
    }
    if (mouseButton == RIGHT)
    {
      manPos.x-= 3;
      manDeg -= PI/6;
    }
  }
}




void DrawAxis()
{
  pushMatrix();
  translate(20, 0, 0);
  fill(255, 0, 0);
  box(10);
  popMatrix();

  pushMatrix();
  translate(0, 20, 0);
  fill(0, 255, 0);
  box(10);
  popMatrix();

  pushMatrix();
  translate(0, 0, 20);
  fill(0, 0, 100);
  box(10);
  popMatrix();
}