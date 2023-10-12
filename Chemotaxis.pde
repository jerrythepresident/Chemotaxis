PImage img;
Jerry [] stars;
void setup()
{
  size(500,500);
  img = loadImage("Jerry.image.PNG");
  stars=new Jerry[100];
  for(int i=0; i<stars.length; i++){
    stars[i]= new Jerry();
  }
}
void draw()
{
  background(0);
  for(int i=0;i<stars.length; i++){
  stars[i].show();
  stars[i].walk();
  }
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
    myX=myX+(int)(Math.random()*5)-2;
    myY=myY+(int)(Math.random()*5)-2;
  float targetX = mouseX;
  float dx = targetX - myX;
  myX += dx * 0.005;
 
  float targetY = mouseY;
  float dy = targetY - myY;
  myY += dy * 0.005;
  }
  
  void show()
  {
  image(img, myX, myY,10,10);
  fill(253, 204, 13);
  pushMatrix();
  star(myX, myY, 30/3, 70/3, 5);
  popMatrix();
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
