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
    //maxXspd = random(2,4);    maxYspd = random(2,4);
    maxXspd = 3;    maxYspd = 3;
    accel = 0.1;    deccel = 0.2;
    xSpeed = 0;    ySpeed = 0;
    health = 100;
    animator = 0;
    enemy = loadImage("Images/enemy.png");
    maxXspd = int(maxXspd); maxYspd = int(maxYspd);
  }
  
  void drawEnemy_Goo(){
    copy(enemy, animator, 0, 32, 32, x, y, 32, 32);
    if(frameCount %int(60/20) == 0){
      if(animator < 512 - 32 ) {
        animator += 32;
        } else { animator = 0; }
      }
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
        //enemy = loadImage("Images/enemy2.png");
        ySpeed -= accel;
        if(ySpeed <= -maxYspd) {
          ySpeed = -maxYspd; 
        } } else { if(ySpeed < 0) {  ySpeed += deccel; }}
  
       if(p1.y >= y) {
         //enemy = loadImage("Images/enemy.png");
         ySpeed += accel;
       if(ySpeed >= maxYspd) {
         ySpeed = maxYspd; 
       } } else { if(ySpeed > 0) { ySpeed -= deccel; }}

    x += xSpeed;
    y += ySpeed;
    
  }
}
