class LEDSensor {
  
  PVector noiseVec = PVector.random2D(); // for the noise
  PVector noiseChange=PVector.random2D();
  int MAX_SPEED=180;
  int offsetx;
  int offsety;

  LEDSensor(int x, int y) {
    offsetx=x;
    offsety=y;
    
  }

  /* sense takes in the current position and orientation of the robot, and returns
  the LEDSensor reading as an integer between 0 and 255.
  */
  int sense(int x, int y, float angle) {
    // Calculate the position of the sensor
    int sensorx=(int)(x+offsetx*cos(angle)-offsety*sin(angle));
    int sensory=(int)(y+offsetx*sin(angle)+offsety*cos(angle));
    //intialize the variables necessary to take a reading value for the value of the sensor
    //and place for the position in the pixel array.
    int value=0;
    int place=0;
    //Calculate noise to add in to the sensor.
    float sensorNoise=noise(noiseVec.x, noiseVec.y);
    noiseVec.add(noiseChange);
    int sNoise=(int) map(sensorNoise, 0, 1, -10, 10); 
    //load pixels to determine the value.
    
    loadPixels();
    for (int i=sensorx-2; i<sensorx+3; i++) {
      for (int j=sensory-2; j<sensory+3; j++) {
        place=j*width+i;
        if (place>0 && place<pixels.length){
          value+=red(pixels[j*width+i]);
        }
      }
    }
    //average and add in the noise
    value=(int)(value/25.0+sNoise);
    //return value.
    return constrain(value, 0, 255);    
    
  }

}
