class UltraSonicSensor extends Sensor {

  int step=5;
  int maxDistance=150;
  int offsetx;
  int offsety;
  float angle;
  float circumStep=.05;
  float sensitivity=130;
  int centerX, centerY;


  UltraSonicSensor(int _x, int _y, float _angle) {
    offsetx=_x;
    offsety=_y;
    angle=_angle;
  }

  int sense(int x, int y, float carAngle) {
    // Send out 
    //loadPixels();
    //calculate the spot we are looking at.
    centerX=(int)(x+offsetx*cos(carAngle)-offsety*sin(carAngle));
    centerY=(int)(y+offsetx*sin(carAngle)+offsety*cos(carAngle));
    // You can see where the sensor is sensing by uncommenting.
    show( carAngle);
    int analyzeX, analyzeY, index;
    float value;
    // Now determine how which 
    for (int radius=step; radius<maxDistance; radius=radius+step) {
      for (float circum=-.5; circum<.5; circum=circum+circumStep) {
        analyzeX=(int)(centerX+radius*cos(carAngle-HALF_PI+circum));
        analyzeY=(int)(centerY+radius*sin(carAngle-HALF_PI+circum));
        index=pixelIndex(analyzeX, analyzeY);
        if ((index>0)&&(index<pixels.length)) {
          value=red(pixels[pixelIndex(analyzeX, analyzeY)]);
          if (value>sensitivity) {
            return radius;
          }
        }
      }
    }
    return maxDistance;
  }

  void show (float carAngle) {
    ellipseMode(CENTER);
    fill(255, 125);
    arc(centerX, centerY, 2*maxDistance, 2*maxDistance, carAngle-.5-HALF_PI, carAngle+.5-HALF_PI, PIE);
    int analyzeX, analyzeY, index;
    float value;
    // Now determine how which 
    for (int radius=step; radius<maxDistance; radius=radius+step) {
      for (float circum=-.5; circum<.5; circum=circum+circumStep) {
        analyzeX=(int)(centerX+radius*cos(carAngle-HALF_PI+circum));
        analyzeY=(int)(centerY+radius*sin(carAngle-HALF_PI+circum));
        index=pixelIndex(analyzeX, analyzeY);
        if ((index>0)&&(index<pixels.length)) {
          fill(255, 0, 0);
          ellipse(analyzeX, analyzeY, 5, 5);
          fill(255);
          value=red(pixels[pixelIndex(analyzeX, analyzeY)]);
          if (value>sensitivity) {
            radius=maxDistance;
            circum=.5;
          }
        }
      }
    }
  }
}
