class EnemyShip {
  // Member Variables
  int x, y, r, lives;   
  float health, spd, dir;
  color c1;
  boolean alive;

  // Constructor
  EnemyShip(int x, int y, int r, color c1) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c1 = c1;
    health = 100.0;
    spd = 5;
    dir = 0;
    alive = true;
  }
  //Display Method
  void display() {
    fill(c1);
    ellipse(x,y,r,r);
  }
}
