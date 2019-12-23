int g_NumReflections;
PVector g_Point;
int g_Mode; //0 = waiting, 1 = tracking mouse
PVector g_PrevMousePos;
float g_MouseVecScale = 1.0f/3.0f;
float g_TileDiameter = 3.0f;

void setup()
{
  size(1000, 1000);
  
  background(0);
  
  g_NumReflections = 16;
  g_Point = PVector.random2D();
  g_Point.mult(10.0f);
}

void draw()
{
  pushMatrix();
  
  stroke(0, 255, 255);
  strokeWeight(3);
  translate(width/2, height/2);
  
  ellipse(g_Point.x, g_Point.y, g_TileDiameter, g_TileDiameter);
  float angle = TWO_PI/(g_NumReflections+1);
  for (int iter = 0; iter < g_NumReflections; iter++)
  {
    rotate(angle);
    ellipse(g_Point.x, g_Point.y, g_TileDiameter, g_TileDiameter);
  }
  
  popMatrix();
}

void mousePressed()
{
   if (mouseButton == LEFT && g_Mode != 1)
   {
     g_Mode = 1;
     g_PrevMousePos = new PVector(mouseX, mouseY);
   }
}

void mouseDragged()
{
   if (g_Mode == 1)
   {
    PVector mousePos = new PVector(mouseX, mouseY);
    PVector mouseMoveDir = PVector.sub(mousePos, g_PrevMousePos);
    mouseMoveDir.normalize();
    PVector newCenterRel = PVector.mult(mouseMoveDir, g_TileDiameter);
    
    g_Point.add(newCenterRel); 
    
    g_PrevMousePos = mousePos;
   }
   
}

void mouseReleased()
{
   if (g_Mode == 1)
   {
      g_Mode = 0; 
   }
}
