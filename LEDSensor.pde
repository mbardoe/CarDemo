class LEDSensor {

  PVector noiseVec = PVector.random2D(); // for the noise
  PVector noiseChange=PVector.random2D();
  int MAX_SPEED=180;
  int offsetx;
  int offsety;

  LEDSensor() {

    
  }


  int sense(int x, int y) {
    
    int value=0;
    int place=0;
    float sensorNoise=noise(noiseVec.x, noiseVec.y);
    noiseVec.add(noiseChange);
    int sNoise=(int) map(sensorNoise, 0, 1, -10, 10); 
    loadPixels();
    for (int i=x-2; i<x+3; i++) {
      for (int j=y-2; j<y+3; j++) {
        place=j*width+i;
        if (place>0 && place<pixels.length){
          value+=red(pixels[j*width+i]);
        }
      }
    }
    value=(int)(value/25.0+sNoise);
    return constrain(value, 0, 255);    
    
  }
}
