class Field {
  ArrayList<Box> things = new ArrayList<Box>();

  int mywidth;
  int myheight;

  Field(int _x, int _y) {
    mywidth=_x;
    myheight=_y;
  }

  //void addBox(Box b) {
  //  things.push(b);
  //}

  void show() {
    background(0);
  }
}
