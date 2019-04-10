class Map {
  float[][][] myMap;
  int myWidth, myHeight;
  int gridsize=5;
  int offx, offy;

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
    PVector sensorHeading = PVector.fromAngle(HALF_PI-angle);
    PVector currentHeading;
    float anglebetween, currdistance, newdenom, oldnotthere, oldthere;
    int currentx, currenty;
    for (int i=0; i<myWidth; i++) {
      for (int j=0; j<myHeight; j++) {
        currentx=(int)(i*(gridsize+.5)-centerx);
        currenty=(int)(j*(gridsize+.5)-centery);
        currentHeading=new PVector(currentx, currenty);
        anglebetween=PVector.angleBetween(sensorHeading, currentHeading);
        if ((anglebetween>-.5)&&(anglebetween<.5)) {
          currdistance=currentHeading.mag();
          if (currdistance<.95*distance) {

            oldnotthere=myMap[i][j][0];
            oldthere=myMap[i][j][1];
            newdenom=.1*oldthere+.9*oldnotthere;
            myMap[i][j][0]=oldnotthere*.9/newdenom;
            myMap[i][j][1]=oldthere*.1/newdenom;
          } else if ((currdistance>.95*distance)&&(currdistance<1.05*distance)) {
            if (distance==150) {
              //nothing there
              oldnotthere=myMap[i][j][0];
              oldthere=myMap[i][j][1];
              newdenom=.1*oldthere+.9*oldnotthere;
              myMap[i][j][0]=oldnotthere*.9/newdenom;
              myMap[i][j][1]=oldthere*.1/newdenom;
            } else {
              //might be something there
              oldnotthere=myMap[i][j][0];
              oldthere=myMap[i][j][1];
              newdenom=.9*oldthere+.1*oldnotthere;
              myMap[i][j][0]=oldnotthere*.1/newdenom;
              myMap[i][j][1]=oldthere*.9/newdenom;
            }
          }
        }
      }
    }
  }
}
