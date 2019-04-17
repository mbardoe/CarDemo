class Map {
  float[][][] myMap;
  int myWidth, myHeight;
  int gridsize=7;
  int offx, offy;
  float hitProb=.7;
  float missProb=.9;

  Map(int offsetx, int offsety, int areawidth, int areaheight) {
    offx=offsetx;
    offy=offsety;
    myWidth=areawidth/gridsize;
    myHeight=areaheight/gridsize;
    myMap=new float[myWidth][myHeight][2];
    for (int i=0; i<myWidth; i++) {
      for (int j=0; j<myHeight; j++) {
        myMap[i][j][0]=.8;
        myMap[i][j][1]=.2;
      }
    }
  }
  void show() {
    for (int i=0; i<myWidth; i++) {
      for (int j=0; j<myHeight; j++) {
        fill(0, 0, 255, (int)(255*myMap[i][j][1]));
        rect(i*gridsize+offx, j*gridsize+offy, gridsize, gridsize);
      }
    }
  }

  void update(int centerx, int centery, float angle, int distance) {
    PVector sensorHeading = PVector.fromAngle(angle -HALF_PI); // try to determine which way the sensor is headed.
    fill(255);
    line(centerx, centery, 30*sensorHeading.x+centerx, 30*sensorHeading.y+centery);
    PVector currentHeading;
    float anglebetween, currdistance;
    int currentx, currenty;
    for (int i=max((int)((centerx-150)/gridsize), 0); i<min((int)((centerx+150)/gridsize), myWidth); i++) {
      for (int j=max((int)((centery-150)/gridsize), 0); j<min((int)((centery+150)/gridsize), myHeight); j++) {
        //print("angle:");
        //println(angle);
        //print("Centery:");
        //println(centery);
        //print("i:");
        //println(i);
        //print("j:");
        //println(j);
        //print("min i:");
        //println(max((int)((centerx-150)/gridsize), 0));
        //print("max i:");
        //println(min((int)((centerx+150)/gridsize), (int)(myWidth/gridsize)));


        currentx=(int)(i*(gridsize+.5)-centerx);
        currenty=(int)(j*(gridsize+.5)-centery);
        currentHeading=new PVector(currentx, currenty);
        anglebetween=PVector.angleBetween(sensorHeading, currentHeading);
        if ((anglebetween>-.5)&&(anglebetween<.5)) {
          currdistance=currentHeading.mag();
          if (currdistance<.95*distance) {
            updateMap(i, j, 0);
          } else if ((currdistance>.95*distance)&&(currdistance<1.05*distance)) {
            if (distance==150) {
              //nothing there
              //println("max distance nothing there");
              updateMap(i, j, 0);
            } else {
              //might be something there
              updateMap(i, j, 1);
            }
          }
        }
      }
    }
  }

  void updateMap(int i, int j, int value) {
    float newdenom;
    float oldnotthere=myMap[i][j][0];
    float oldthere=myMap[i][j][1];
    if (value==0) {
      fill(125, 125,0);
      ellipse((i)*gridsize +width/2, (j)*gridsize, gridsize,gridsize);
      fill(255);
      newdenom=(1-missProb)*oldthere+missProb*oldnotthere;
      myMap[i][j][0]=oldnotthere*missProb/newdenom;
      myMap[i][j][1]=oldthere*(1-missProb)/newdenom;
    } else if (value==1) {
      fill(0, 125,125);
      ellipse((i)*gridsize +width/2, (j)*gridsize, gridsize,gridsize);
      fill(255);
      newdenom=hitProb*oldthere+(1-hitProb)*oldnotthere;
      myMap[i][j][0]=oldnotthere*(1-hitProb)/newdenom;
      myMap[i][j][1]=oldthere*hitProb/newdenom;
    }
  }
}
