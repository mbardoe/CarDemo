class Car {
  /* A car will have 20 by 20 dimensions
   the wheels will be at the back and sides with dimension
   6 by 10.
   */

  PVector position;
  float angle;
  Wheel leftWheel= new Wheel();
  Wheel rightWheel= new Wheel();
  int wheelradius=13;
  LEDSensor ledSensorRight= new LEDSensor();
  LEDSensor ledSensorLeft= new LEDSensor();
  int sensorValueRight=0;
  int sensorValueLeft=0;
  






  Car(int x, int y, float theta) {
    position=new PVector(x, y);
    angle = theta;
  }
  void setLeftSpeed(int s) {
    leftWheel.setSpeed(s);
  }

  void setRightSpeed(int s) {
    rightWheel.setSpeed(s);
  }
  
  void LEDSense(){
    // step one is to determine where the sensors are.
    // angle here is from the up...
    int rightsensorx=(int)(position.x+13*cos(angle)+14*sin(angle));
    int rightsensory=(int)(position.y+13*sin(angle)-14*cos(angle));
    int leftsensorx=(int)(position.x-13*cos(angle)+14*sin(angle));
    int leftsensory=(int)(position.y-13*sin(angle)-14*cos(angle));
    sensorValueRight=ledSensorRight.sense(rightsensorx, rightsensory);
    sensorValueLeft=ledSensorLeft.sense(leftsensorx, leftsensory);
    //fill(0,0,255);
    //ellipse(rightsensorx+5, rightsensory+5, 10,10);
    //print(leftsensorx);
    //print("   ");
    //println(leftsensory);
  }

  void show() {
    fill(255);
    push();
      rectMode(CENTER);
      ellipseMode(CENTER);
      translate(position.x, position.y);
      rotate(angle);
      // main frame
      rect(0, 0, 20, 20);
      //right motor
      rect(-13, 5, 6, 10);
      //left motor
      rect(13, 5, 6, 10);
      //We need to sense before we draw the sensor to see what is there. 
      pop();
      LEDSense();
      push();
      translate(position.x, position.y);
      rotate(angle);
      //right Sensor
      if (sensorValueRight>128) {
        fill(255, 0, 0);
      } else
      {
        fill(255);
      }
      ellipse(13, -14, 8, 8);
      //left Sensor
      if (sensorValueLeft>128) {
        fill(255, 0, 0);
      } else
      {
        fill(255);
      }
      ellipse(-13, -14, 8, 8);
    pop();
  }

  void move() {
    
    // calculate angle change.
    float deltaAngle;
    float leftspeed=leftWheel.giveSpeed()/15.0;
    //println(leftspeed);
    float rightspeed=rightWheel.giveSpeed()/15.0;
    if (leftspeed==rightspeed) {
      PVector delta=PVector.fromAngle(angle-HALF_PI);
      PVector showDelta = PVector.fromAngle(angle-HALF_PI);
      showDelta.mult(30);
      delta.mult(leftspeed);
        //fill(255,0,0);
        //strokeWeight(5);
        //line(position.x, position.y,position.x+40*showDelta.x, position.y+40*showDelta.y);
        //strokeWeight(1);
      position.add(delta);
    }
    
    else{
      deltaAngle=(leftspeed-rightspeed)/wheelradius;
      // calculate new position

      int turnradius=(int)(rightspeed/deltaAngle);
      PVector centerRotation= new PVector (int(position.x+(13+turnradius)*sin(HALF_PI-angle)), 
        (int)(position.y+(13+turnradius)*cos(HALF_PI-angle)));
      //fill(255);
      //ellipse(centerRotation.x, centerRotation.y, 5, 5);
      //PVector turnArm=position.sub(centerRotation);
      PVector turnArm= new PVector(position.x-centerRotation.x, position.y-centerRotation.y);
      turnArm.rotate(deltaAngle);
      position=centerRotation.add(turnArm);
      angle+=deltaAngle;
    }
  }
}
