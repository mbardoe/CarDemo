class LineFollowerMKB extends DriveSystem {

  LineFollowerMKB(Car mCar){
    super(mCar);
  }
  
  void drive() {
    if (noSense==0) {
      int rightLED=myCar.sensorValueRight;
      int leftLED=myCar.sensorValueLeft;
      if (rightLED>128 && leftLED<128) {
        //turn right

        myCar.setRightSpeed(-5);
        myCar.setLeftSpeed(5);
        setNoSense(7);
      } 
      else if (rightLED<128 && leftLED>128) {
        //turn right
        myCar.setRightSpeed(5);
        myCar.setLeftSpeed(-5);
        setNoSense(7);
      } else {
        myCar.setRightSpeed(40);
        myCar.setLeftSpeed(40);
        setNoSense(0);
      }
    } else {
      noSense--;
    }
  }
}
