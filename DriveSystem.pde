class DriveSystem{
  Car myCar;
  int noSense;
  DriveSystem(Car mcar){
    myCar=mcar;
  }
  
  void drive(){
    myCar.setLeftSpeed(30);
    myCar.setRightSpeed(30);
  }
  
  void setNoSense(int n){
    noSense=max(n,0);
  }
}
