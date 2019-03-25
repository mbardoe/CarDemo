class LineFollowerMKB extends DriveSystem {

  LineFollowerMKB(Car mCar) {
    super(mCar);
  }

  void drive() {

    int rightLED=myCar.sensorValueRight;
    int leftLED=myCar.sensorValueLeft;
    if (rightLED>128 && leftLED<128) {
      //turn right

      myCar.setRightSpeed(-5);
      myCar.setLeftSpeed(5);
      //setNoSense(7);
      delay(7);
    } else if (rightLED<128 && leftLED>128) {
      //turn right
      myCar.setRightSpeed(5);
      myCar.setLeftSpeed(-5);
      delay(7);
    } else {
      myCar.setRightSpeed(40);
      myCar.setLeftSpeed(40);
      delay(0);
    }
  }
}
