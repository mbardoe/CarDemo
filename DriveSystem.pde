class DriveSystem {
  Car myCar;
  int noSense=0;
  int approach=0;
  DriveSystem(Car mcar) {
    myCar=mcar;
  }
  /*drive is the main method here, and one that needs to be overwritten for a drivesystem.
   */
  void drive() {
    //override me.
    if (noSense==0) {
      if (approach==0) {
        myCar.setLeftSpeed(30);
        myCar.setRightSpeed(30);
        approach=1;
        setNoSense(40);
        
      } else if (approach==1) {
        myCar.setLeftSpeed(5);
        myCar.setRightSpeed(-5);
        setNoSense(30);
        approach=0;
      }
    }
    noSense--;
  }
  /* noSense is a function that works like delay. 
   */
  void setNoSense(int n) {
    noSense=max(n, 0);
  }
}
