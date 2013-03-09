class Table{
  int x, y;
  Table(int _x, int _y){
    x = _x;
    y = _y;
  }
  
  void display(){
    fill(0, 255, 0);
    rect(x, y, 40, 80);  
  }
}
