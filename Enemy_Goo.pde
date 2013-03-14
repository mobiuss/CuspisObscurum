class Enemy_Goo{
  int x, y;
  float maxXspd, maxYspd;
  float accel, deccel;
  float xSpeed, ySpeed;
  int health;
  int animator;
  PImage enemy;
  
  Enemy_Goo(int _x, int _y){
    x = _x;    y = _y;
    //maxXspd = 1;    maxYspd = 1;
    maxXspd = random(2,4);    maxYspd = random(2,4);
    accel = 0.2;    deccel = 0.2;
    xSpeed = 0;    ySpeed = 0;
    health = 100;
    animator = 0;
    enemy = loadImage("Images/enemy.png");
    maxXspd = int(maxXspd); maxYspd = int(maxYspd);
  }
  
  void basicCollisions(){
    if(y < 150) { y=150; ySpeed = 0; }
    if(x < 150) { x=150; xSpeed = 0; }
    if(x > 1098) { x=1098; xSpeed = 0; }
    if(y > 688) { y=688; ySpeed = 0; }
  }
  
  void drawEnemy_Goo(){
    copy(enemy, animator, 0, 32, 32, x, y, 32, 32);
    if(frameCount %int(60/20) == 0){
      if(animator < 512 - 32 ) {
        animator += 32;
        } else { animator = 0; }
      }
    }
    
  void attack(){
    if(p1.x >= x && p1.x <= x+32 && p1.y >= y && p1.y <= y+32) { p1.health -= 1; xSpeed = -xSpeed / 2; ySpeed = -ySpeed / 2; }
    if(p1.x+32 >= x && p1.x+32 <= x+32 && p1.y >= y && p1.y <= y+32) { p1.health -= 1; xSpeed = -xSpeed / 2; ySpeed = -ySpeed / 2;}
    if(p1.x+32 >= x && p1.x+32 <= x+32 && p1.y+32 >= y && p1.y+32 <= y+32) { p1.health -= 1; xSpeed = -xSpeed / 2; ySpeed = -ySpeed / 2;}
    if(p1.x >= x && p1.x <= x+32 && p1.y+32 >= y && p1.y+32 <= y+32) { p1.health -= 1; xSpeed = -xSpeed / 2; ySpeed = -ySpeed / 2; }
    if(p1.health <= 0) { playing = false; }
    println(p1.health);
  }

  void movement(){
      if(p1.x <= x){
        xSpeed -= accel;
        if(xSpeed <= -maxXspd) {
          xSpeed = -maxXspd;
        } } else { if(xSpeed < 0) { xSpeed += deccel; } }
        
       if(p1.x >= x) {
         xSpeed += accel;
         if(xSpeed >= maxXspd) {
           xSpeed = maxXspd;
         } } else { if(xSpeed > 0) { xSpeed -= deccel; }}
       
       if(p1.y <= y) {
        enemy = loadImage("Images/enemy2.png");
        ySpeed -= accel;
        if(ySpeed <= -maxYspd) {
          ySpeed = -maxYspd; 
        } } else { if(ySpeed < 0) {  ySpeed += deccel; }}
  
       if(p1.y >= y) {
         enemy = loadImage("Images/enemy.png");

         ySpeed += accel;
       if(ySpeed >= maxYspd) {
         ySpeed = maxYspd; 
       } } else { if(ySpeed > 0) { ySpeed -= deccel; }}

    x += xSpeed;
    y += ySpeed;
    
  }
}
