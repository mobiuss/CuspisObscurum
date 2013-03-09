class Player{
  int x, y;
  int maxXspd, maxYspd;
  float accel, deccel;
  float xSpeed, ySpeed;
  int attX, attY, attW, attH;
  boolean Attacking;

  Player(int _x, int _y){
    x = _x;    y = _y;
    maxXspd = 4;    maxYspd = 4;
    accel = 1;    deccel = 0.1;
    xSpeed = 0;    ySpeed = 0;  
  }
 
 
 void Attack(){
   rect(attX, attY, attW, attH);
   if(attUp){ fill(255); attX = x-7; attY = y-55; attW = 45; attH = 55;}
   else if(attDown) { fill(255); attX = x-7; attY = y+32; attW = 45; attH = 55;}
   else if(attLeft) { fill(255); attX = x-55; attY = y-5; attW = 55; attH = 45;}
   else if(attRight) { fill(255); attX = x+32; attY = y-5; attW = 55; attH = 45;}
   else { attX = 0; attY = 0; attW = 0; attH = 0; }
       for (int i = enemy_Goo.size()-1; i >= 0; i--) {
         Enemy_Goo eg = (Enemy_Goo) enemy_Goo.get(i);
         if(eg.x >= attX && eg.x <= attX + attW &&eg.y >= attY && eg.x <= attY + attH) {
             if(xSpeed > ySpeed) { eg.health -= int(xSpeed) * 2; }
             else { eg.health -= int(ySpeed) * 2; }       
         }
         else if(eg.x+32 >= attX && eg.x+32 <= attX + attW &&eg.y >= attY && eg.x <= attY + attH) {
           if(xSpeed > ySpeed) { eg.health -= int(abs(xSpeed)) * 2; }
           else { eg.health -= int(abs(ySpeed)) * 2; }   
         }
         if(eg.health <= 0) { enemy_Goo.remove(i); }
       }
     }
 
void movement(){ 
  if(up) {
    ySpeed -= accel;
    if(ySpeed <= -maxYspd) {
      ySpeed = -maxYspd; 
    } } else { if(int(ySpeed) < 0) {  ySpeed += deccel;}} // MOVE UP
  
  if(down) {
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
    fill(255);
    rect(x, y, 32, 32);
  }
  
  void basicCollisions(){
    if(y < 150) { y=150; ySpeed = 0; }
    else if(x < 150) { x=150; xSpeed = 0; }
    else if(x > 1098) { x=1098; xSpeed = 0; }
    else if(y > 688) { y=688; ySpeed = 0; }
  }
  
}
