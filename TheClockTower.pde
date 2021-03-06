PImage background;
ArrayList enemy_Goo;
ArrayList hole;
boolean playing;
boolean up, down, left, right, attUp, attDown, attLeft, attRight, Attack;
Player p1;
int currentRoom = 1;

public void setup(){
  size(1280, 720);
  background(0);
  loadMenuImages();
  enemy_Goo = new ArrayList();
  hole = new ArrayList();
  p1 = new Player(630, 680);
  loadRoom();
}

public void loadRoom(){
    if(currentRoom == 1) {Room1();}
    if(currentRoom == 2) {Room2();}
    if(currentRoom == 3) {Room3();}
    if(currentRoom == 4) {Room4();}
    
}

public void loadMenuImages(){
  background = loadImage("Images/title.png");
}

public void loadImages(){
  background = loadImage("Images/background1.png");
}

public void methodRunPlayers(){
  p1.movement();
  p1.showPlayer();
  p1.basicCollisions();
  p1.Attack();
}

public void ladderCollisions(){
  fill(0, 0, 255);
  rect(1000, 150, 120, 120);
  if(p1.x + 32 >= 1000 && p1.y <= 150 + 120) {
    if(enemy_Goo.size() == 0) {clearArrays(); currentRoom++; loadRoom();}
  }
}

public void enemy_Goo(){
  for (int i = enemy_Goo.size()-1; i >= 0; i--) {
    Enemy_Goo eg = (Enemy_Goo) enemy_Goo.get(i);
    eg.drawEnemy_Goo();
    eg.movement();
    eg.basicCollisions();
    eg.attack();
    println(eg.health);
  }    
}

public void hole(){
  for (int i = hole.size()-1; i >= 0; i--) {
    Hole h = (Hole) hole.get(i);
    h.drawHole();
    h.collisions();
  }    
}

int n = 0;
public void collisions(){ 
  if(enemy_Goo.size() > 1){  
     Enemy_Goo eg1 = (Enemy_Goo) enemy_Goo.get(n);
     int x1 = eg1.x; int y1 = eg1.y; //X & Y of the enemy you want to chec
    for (int i = enemy_Goo.size()-1; i >= 0; i--) {
      if(i == n) { } else {
        Enemy_Goo eg = (Enemy_Goo) enemy_Goo.get(i);
      if(x1+32 >= eg.x && x1+32 <= eg.x+32 && y1 >= eg.y && y1 <= eg.y+32) { eg.xSpeed = 0; eg.ySpeed = 0; eg.x += 5; eg.y-=5;}//Top right
      if(x1 >= eg.x && x1 <= eg.x+32 && y1 >= eg.y && y1 <= eg.y+32) {eg.xSpeed = 0; eg.ySpeed = 0; eg.x -= 5; eg.y -= 5;} // Top left
      if(x1 >= eg.x && x1 <= eg.x+32 && y1+32 >= eg.y && y1+32 <= eg.y+32) { eg.xSpeed = 0; eg.ySpeed = 0; eg.x-=5; eg.y-=5;} //Bottom left
      if(x1+32 >= eg.x && x1+32 <= eg.x+32 && y1+32 >= eg.y && y1+32 <= eg.y+32) { eg.xSpeed = 0; eg.ySpeed = 0; eg.x+=5; eg.y+=-5;}//Bottom Right
    }
 }
 if(n < enemy_Goo.size()-1) {n++;} else { n = 0; }
  }
}



public void draw(){
  if(playing) {
  image(background, 0, 0);
  ladderCollisions();
  methodRunPlayers();
  enemy_Goo();
  hole();
  collisions();
  //fill(239, 255, 152, 100);  THIS WAS THE LIGHT TEST
  //triangle(230, 275, 258, 220, 286, 275);
  } else { image(background, 0, 0); }
}

public void keyPressed(){
  if(key == 's' || key == 'S') { if(playing == false) { loadImages(); } playing = true;}  
  if(key == CODED){
    if(keyCode == UP) { attUp = true; attDown = false; attLeft = false; attRight = false; p1.attackDone = false;}
    if(keyCode == DOWN) { attDown = true; attUp = false; attLeft = false; attRight = false; p1.attackDone = false;}
    if(keyCode == RIGHT) { attRight = true; attDown = false; attLeft = false; attUp = false; p1.attackDone = false;}
    if(keyCode == LEFT) { attLeft = true; attDown = false; attUp = false; attRight = false; p1.attackDone = false;}
  }
 
  if(key == 'W' || key == 'w') { up = true; }
  if(key == 'S' || key == 's') { down = true; }
  if(key == 'D' || key == 'd') { right = true; }
  if(key == 'A' || key == 'a') { left = true; }
  
}

public void keyReleased(){
  if(key == CODED){
    if(keyCode == UP) { attUp = false; }
    if(keyCode == DOWN) { attDown = false; }
    if(keyCode == RIGHT) { attRight = false; }
    if(keyCode == LEFT) { attLeft = false; }
    if(keyCode == CONTROL) { Attack = false; }
  }
  
  if(key == 'W' || key == 'w') { up = false; }
  if(key == 'S' || key == 's') { down = false; }
  if(key == 'D' || key == 'd') { right = false; }
  if(key == 'A' || key == 'a') { left = false; }
}
