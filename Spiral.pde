int g_NumReflections;
PVector g_Point;
int g_Mode; //0 = waiting, 1 = tracking mouse
PVector g_PrevDrawPos;
float g_MouseVecScale = 1.0f/3.0f;

void setup()
{
  size(1000, 1000);
  
  background(0);
  
  g_NumReflections = 16;
  g_Point = PVector.random2D();
  g_Point.mult(10.0f);
  g_PrevDrawPos = new PVector(width/2, height/2);
}

void draw()
{
  pushMatrix();
  
  stroke(0, 255, 255);
  strokeWeight(3);
  translate(width/2, height/2);
  
  point(g_Point.x, g_Point.y);
  float angle = TWO_PI/(g_NumReflections+1);
  for (int iter = 0; iter < g_NumReflections; iter++)
  {
    rotate(angle);
    point(g_Point.x, g_Point.y);
  }
  
  popMatrix();
}

void mousePressed()
{
   if (mouseButton == LEFT && g_Mode != 1)
   {
     g_Mode = 1;
     g_PrevDrawPos = new PVector(mouseX, mouseY);
   }
}

void mouseDragged()
{
   g_Point.add(PVector.mult(PVector.sub(new PVector(mouseX, mouseY), g_PrevDrawPos), g_MouseVecScale));
}

void mouseReleased()
{
   if (g_Mode == 1)
   {
      g_Mode = 0; 
   }
}
