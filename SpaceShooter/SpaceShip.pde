class SpaceShip {
  // Member Variables
  int x, y, r, lives;   
  float health, spd, dir;
  color c1, c2, c3;
  boolean alive;

  // Constructor
  SpaceShip(int x, int y, int r, color c1) {
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
  void display(int x, int y) {
     // draw wings
  fill(200, 30, 30);
  quad(x, y+30, x-35, y+30, x-45, y+20, x, y-30);
  quad(x, y+30, x+35, y+30, x+45, y+20, x, y-30);

  noStroke();
  triangle(x+35, y+30, x+35, y-20, x+50, y+30);
  triangle(x-35, y-20, x-35, y+30, x-50, y+30);

  // draw hull
  stroke(1);
  ellipse(x, y, 30, 80);

  // draw cockpit
  fill(100);
  ellipse(x, y-15, 15, 25);
  }

  //Behavior Method
  void thrust() {}
  
  void fire() {}
}
