class Hole{
  int x, y;
  PImage hole;
  Hole(int _x, int _y){
    x = _x;
    y = _y;
    hole = loadImage("Images/hole.png");
  }
  
  void collisions(){
    if(p1.x >= x && p1.x <= x+32 && p1.y >= y && p1.y <= y+32) { playing = false; }
    if(p1.x+32 >= x && p1.x+32 <= x+32 && p1.y >= y && p1.y <= y+32) { playing = false; }
    if(p1.x+32 >= x && p1.x+32 <= x+32 && p1.y+32 >= y && p1.y+32 <= y+32) { playing = false; }
    if(p1.x >= x && p1.x <= x+32 && p1.y+32 >= y && p1.y+32 <= y+32) { playing = false; }
  }
  
  void drawHole(){
    image(hole, x, y);
  }
}
