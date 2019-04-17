class MyDriveSystem extends DriveSystem {
  int svr, svl;
  int rightSpeed, leftSpeed;
  int approach=0;
  int step;
  MyDriveSystem(Car myCar){
    super(myCar);
  }
  
  void drive() {
    //println("driving");
    if (noSense<=0) {
      //print("using approach: ");
      //println(approach);
      if (approach==0) {
        svr=myCar.sensorValueRight;
        svl=myCar.sensorValueLeft;
        if (svl>120 || svr>120) {
          approach=1;
        } else {
          leftSpeed=20;
          rightSpeed=20;
          //println("right sensor:");
          //println(myCar.sensorValueRight);
          //println("left sensor:");
          //println(myCar.sensorValueLeft);
          myCar.setLeftSpeed(leftSpeed);
          myCar.setRightSpeed(rightSpeed);
        }
      } else if (approach==1) {
        //Hit a wall head on
        if (step==0) {
          //backup
          myCar.setLeftSpeed(-20);
          myCar.setRightSpeed(-20);
          setNoSense(30);
          step=1;
        } else if (step==1) {
          // Turn Left
          myCar.setLeftSpeed(0);
          myCar.setRightSpeed(20);
          setNoSense(10);
          step=2;
        } else if (step==2) {
          //Move Ahead
          myCar.setLeftSpeed(20);
          myCar.setRightSpeed(20);
          setNoSense(20);
          approach=0;
          step=0;
        }
      }

      //approach=1;
      //setNoSense(40);
    }
    noSense--;
  }
}
