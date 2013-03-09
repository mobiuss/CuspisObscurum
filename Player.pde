class Player{
  int x, y;
  int maxXspd, maxYspd;
  float accel, deccel;
  float xSpeed, ySpeed;
  int attX, attY, attW, attH;
  boolean Attacking;
  PImage player;
  int attSpeed, dmg;
  int animator;
  int attanimator;
  PImage attack;
  boolean attackDone;

  Player(int _x, int _y){
    x = _x;    y = _y;
    maxXspd = 2;    maxYspd = 2;
    accel = 1;    deccel = 0.1;
    xSpeed = 0;    ySpeed = 0;
    player = loadImage("Images/player1.png");
    attack = loadImage("Images/attackL1.png");
    animator = 0;
    attanimator = 0;
    attackDone = false;
  }
 
 int xdif, ydif;
 
 void Attack(){
   //rect(attX, attY, attW, attH);
   if(attUp){ fill(255); attX = x-7; attY = y-55; attW = 45; attH = 55;}
   else if(attDown) { fill(255); attX = x-7; attY = y+32; attW = 45; attH = 55;}
   else if(attLeft) { fill(255); attX = x-55; attY = y-5; attW = 55; attH = 45; xdif = -10; ydif = 0;}
   else if(attRight) { fill(255); attX = x+32; attY = y-5; attW = 55; attH = 45;}
   else { attX = 0; attY = 0; attW = 0; attH = 0; }
     if(attackDone == false) {
       copy(attack, attanimator, 0, 32, 32, x + xdif, y + ydif, 32, 32); 
       attackSprite();
       for (int i = enemy_Goo.size()-1; i >= 0; i--) {
         Enemy_Goo eg = (Enemy_Goo) enemy_Goo.get(i);
         if(eg.x >= attX && eg.x <= attX + attW &&eg.y >= attY && eg.y <= attY + attH) {
             eg.health -= 1;    
             //REST OF ATTACKING CODE GOES HERE   
         }
         else if(eg.x+32 >= attX && eg.x+32 <= attX + attW &&eg.y >= attY && eg.y <= attY + attH) {
             eg.health -= 1;
             //AND HERE 
         }
         if(eg.health <= 0) { enemy_Goo.remove(i); }
       }
     }
   }
 
void movement(){ 
  if(up) {
    animate();
    ySpeed -= accel;
    if(ySpeed <= -maxYspd) {
      ySpeed = -maxYspd; 
    } } else { if(int(ySpeed) < 0) {  ySpeed += deccel;}} // MOVE UP
  
  if(down) {
    animate();
    ySpeed += accel;
    if(ySpeed >= maxYspd) {
      ySpeed = maxYspd; 
    } } else { if(int(ySpeed) > 0) { ySpeed -= deccel;}} // MOVE DOWN
    
  if(left) {
    xSpeed -= accel;
    if(xSpeed <= -maxXspd) {
      xSpeed = -maxXspd;
    } } else { if(int(xSpeed) < 0) { xSpeed += deccel;}} //MOVE LEFT
    
  if(right) {
    xSpeed += accel;
    if(xSpeed >= maxXspd) {
      xSpeed = maxXspd;
    } } else { if(int(xSpeed) > 0) { xSpeed -= deccel;} } // MOVE RIGHT
  
  y += int(ySpeed);
  x += int(xSpeed);
  }
  
  void showPlayer(){
    copy(player, animator, 0, 32, 32, x, y, 32, 32);
  }
  
  void animate(){
    if(frameCount %int(60/10) == 0){
      if(animator < 128 - 32 ) {
        animator += 32;
        } else { animator = 0; }
      }
  }  
  
  void attackSprite(){
    if(frameCount %int(60/20) == 0){
      if(attanimator < 256 - 32 ) {
        attanimator += 32;
        } else { attackDone = true; println("lol"); attanimator = 0;}
      }
  }
  
  void basicCollisions(){
    if(y < 150) { y=150; ySpeed = 0; }
    if(x < 150) { x=150; xSpeed = 0; }
    if(x > 1098) { x=1098; xSpeed = 0; }
    if(y > 688) { y=688; ySpeed = 0; }
  }
  
}
