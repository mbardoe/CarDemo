class Wheel{
  int speed;
  //PVector position;
  int MAX_SPEED=255;
  PVector noiseVec = PVector.random2D(); // for the noise
  PVector noiseChange=PVector.random2D();
  Wheel(){
    //position = new PVector(x,y);
    speed=0;
  }
  
  void setSpeed(int s){
    speed = s;
    if (speed<-1*MAX_SPEED){
      speed=-1*MAX_SPEED;
    }
    if (speed>MAX_SPEED){
      speed=MAX_SPEED;
    }
  }
  
  int giveSpeed(){
    float slippagenoise=noise(noiseVec.x,noiseVec.y);
    noiseVec.add(noiseChange);
    int slippage=(int) map(slippagenoise,0,1,-5,5);
    //int slippage=0;
    return speed+slippage;
  }
  
}
