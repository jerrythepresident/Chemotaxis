PImage img;
Jerry [] stars;
me bob;
void setup()
{
  size(500,500);
  img = loadImage("Jerry.image.PNG");
  stars=new Jerry[100];
  for(int i=0; i<stars.length; i++){
    stars[i]= new Jerry();
  }
  bob = new me(250,250);
}
void draw()
{
  background(#4BB6EF);
  for(int i=0;i<stars.length; i++){
  stars[i].show();
  stars[i].walk();
  }
  bob.walk();
  bob.show();
}
class Jerry
{
  int myX,myY;
  Jerry()
  {
  myX=(int)(Math.random()*501);
  myY=(int)(Math.random()*501);
  }
  void walk()
  {
    myX=myX+(int)(Math.random()*7)-3;
    myY=myY+(int)(Math.random()*7)-3;
  float targetX = mouseX;
  float dx = targetX - myX;
  myX += dx * 0.008;
 
  float targetY = mouseY;
  float dy = targetY - myY;
  myY += dy * 0.008;
  }
  
  void show()
  {
  fill(253, 204, 13);
  pushMatrix();
  star(myX, myY, 10, 70/3, 5);
  popMatrix();
  }
}

class me
{
  int myX,myY;
  me(int x, int y)
  {
  myX=x;
  myY=y;
  }
  void walk()
  {
  myX=myX+(int)(Math.random()*5)-2;
  myY=myY+(int)(Math.random()*5)-2;
  float targetX = mouseX;
  float dx = targetX - myX;
  myX += dx ;
 
  float targetY = mouseY;
  float dy = targetY - myY;
  myY += dy ;
  } 
  void show()
  {
  image(img, myX, myY, 60, 60);
  }
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
