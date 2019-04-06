abstract class Box {
  
  
  int x;
  int y;
  
  Box(int _x, int _y){
    x=_x;
    y=_y;
  }
  
  abstract void show();
  abstract PVector[] corners();
  PVector center(){
    return new PVector(x,y);
  }
}
  
