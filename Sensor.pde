abstract class Sensor{
 
  
  abstract int sense(int x, int y, float angle);
  
  int pixelIndex(int x, int y){
    return x+width*y;
  }
}
