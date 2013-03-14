class Item{
  int x, y;
  PImage item;
  int dmg;
  
  Item(int _x, int _y){
    x = _x;
    y = _y;
  }
  
  void sword(){
    item = loadImage("Images/sword.png");
    dmg = 2;
  }
  
  void axe(){
    item = loadImage("Images/axe.png");
    dmg = 3;
  }
  
  void dagger(){
    item = loadImage("Images/dagger.png");
    dmg = 1;
  }
  
  void display(){
    fill(0, 255, 0);
    rect(x, y, 40, 80);  
  }
}
