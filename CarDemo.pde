Car myCar;
DriveSystem drive;
Field field;
int num_obs=3;

void setup(){
  size(800,600);
  myCar=new Car(100, 40, PI/2+.1);
  //drive=new LineFollowerMKB(myCar);
  drive=new MyDriveSystem(myCar);
  field=new Field(width/2, height);
  for (int i=0; i<num_obs; i++){
    field.addObstacle();
  }
}

void draw(){
  background(0);
  // Draw obstacles before the car so that the sensors can work correctly.
  //drawPath();
  field.show();
  myCar.show();
  drive.drive();
  myCar.move();
}

void drawPath(){
  strokeWeight(7);
  stroke(255);
  line(50,50,width-80,50);
  line(width-80,50,width-80,height-60);
  line(width-80,height-60, 50,height-60);
  line(50,height-60, 50,50);
  //line(300,0,300,height);
  strokeWeight(0);
}
