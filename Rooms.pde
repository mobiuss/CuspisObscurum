void Room1(){
    enemy_Goo.add(new Enemy_Goo(200, 200));
    hole.add(new Hole(500, 500));
  }
  
void Room2(){
  enemy_Goo.add(new Enemy_Goo(100, 100));
  enemy_Goo.add(new Enemy_Goo(500, 100));
}

void Room3(){
  enemy_Goo.add(new Enemy_Goo(840, 300));
  enemy_Goo.add(new Enemy_Goo(200, 600)); 
}

void Room4(){
  hole.add(new Hole(500, 500));
  enemy_Goo.add(new Enemy_Goo(200, 600)); 
}

void clearArrays(){
  for (int i = enemy_Goo.size()-1; i >= 0; i--) {
    Enemy_Goo eg = (Enemy_Goo) enemy_Goo.get(i);
    enemy_Goo.remove(i);
 }
 
 for (int i = hole.size()-1; i >= 0; i--) {
    Hole h = (Hole) hole.get(i);
    hole.remove(i);
 }
}
