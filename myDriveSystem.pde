class MyDriveSystem extends DriveSystem {
  
  MyDriveSystem(Car myCar){
    super(myCar);
  }
  
  void drive() {
    if (noSense==0) {
      if (approach==0) {
        myCar.setLeftSpeed(30);
        myCar.setRightSpeed(30);
        approach=1;
        setNoSense(80);
      } else if (approach==1) {
        myCar.setLeftSpeed(5);
        myCar.setRightSpeed(-5);
        setNoSense(30);
        approach=0;
      }
    }
    noSense--;
  }
}
