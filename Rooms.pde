void Room1(){
    enemy_Goo.add(new Enemy_Goo(200, 200));
    enemy_Goo.add(new Enemy_Goo(700, 700));
  }

float roomselect;
int stopRandom;
void selectRoom(){
  roomselect = random(1, 3);
  stopRandom++;
  switch(int(roomselect)) {  
    case 1:
      for (int i = enemy_Goo.size()-1; i >= 0; i--) {
        Enemy_Goo eg = (Enemy_Goo) enemy_Goo.get(i);
        enemy_Goo.remove(i);
      }
      enemy_Goo.add(new Enemy_Goo(100, 100));
      enemy_Goo.add(new Enemy_Goo(200, 100));
    break;  

    case 2:
      for (int i = enemy_Goo.size()-1; i >= 0; i--) {
        Enemy_Goo eg = (Enemy_Goo) enemy_Goo.get(i);
        enemy_Goo.remove(i);
      }
      enemy_Goo.add(new Enemy_Goo(300, 300));
      enemy_Goo.add(new Enemy_Goo(400, 300)); 
    break;
    
    case 3:
      for (int i = enemy_Goo.size()-1; i >= 0; i--) {
        Enemy_Goo eg = (Enemy_Goo) enemy_Goo.get(i);
        enemy_Goo.remove(i);
      }
      enemy_Goo.add(new Enemy_Goo(500, 500));
      enemy_Goo.add(new Enemy_Goo(600, 500));
    break;
    
    default: println("Ah fack");
  }
}
