class DriveSystem{
  Car myCar;
  int noSense=0;
 
  DriveSystem(Car mcar){
    myCar=mcar;
  }
  /*drive is the main method here, and one that needs to be overwritten for a drivesystem.
  */
  void drive(){
    //override me.
    myCar.setLeftSpeed(30);
    myCar.setRightSpeed(30);
    setNoSense(20);
    
  }
  /* noSense is a function that works like delay. 
  */
  void setNoSense(int n){
    noSense=max(n,0);
  }

}
