class UltraSonicSensor{
  
  int step=5;
  int maxDistance=50;
  int offsetx;
  int offsety;
  float angle;
  float circumStep=.05
  
  
  UltraSonicSensor(int _x, int _y, float _angle){
    offsetx=_x;
    offsety=_y;
    angle=_angle;
  }
  
  int sense(int x, int y){
    int centerX, centerY;
    // Send out 
    loadPixels();
    // Now determine how which 
    for (int radius=step; radius<maxDistance; radius=radius+step){
      for (int circum=-.5; circum<.5; circum=circum+circumStep){
        //calculate the spot we are looking at.
          centerX=(int)(x+xoffset-radius*sin(angle));
          centerY=(int)(y+yoffset-radius*cos(angle));
          
        //average evaluate that 
        
      }
    }
    return maxDistance;
  }
    
  
