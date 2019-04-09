class UltraSonicSensor extends Sensor{
  
  int step=5;
  int maxDistance=300;
  int offsetx;
  int offsety;
  float angle;
  float circumStep=.05;
  
  
  UltraSonicSensor(int _x, int _y, float _angle){
    offsetx=_x;
    offsety=_y;
    angle=_angle;
  }
  
  int sense(int x, int y, float carAngle){
    int centerX, centerY;
    // Send out 
    //loadPixels();
    //calculate the spot we are looking at.
    centerX=(int)(x+offsetx*cos(carAngle)-offsety*sin(carAngle));
    centerY=(int)(y+offsetx*sin(carAngle)+offsety*cos(carAngle));
    ellipseMode(CENTER);
    arc(centerX, centerY, maxDistance,maxDistance, carAngle-.5-HALF_PI, carAngle+.5-HALF_PI, PIE);
    int analyzeX, analyzeY;
    float value;
    // Now determine how which 
    for (int radius=step; radius<maxDistance; radius=radius+step){
      for (float circum=-.5; circum<.5; circum=circum+circumStep){
        analyzeX=(int)(centerX+radius*cos(carAngle-HALF_PI+circum));
        analyzeY=(int)(centerY+radius*sin(carAngle-HALF_PI+circum));
        
        value=red(pixels[pixelIndex(analyzeX,analyzeY)]);
        if (value>130){
          return radius;
        }
        
          
        }
    }
    return maxDistance;
  }
    
}
