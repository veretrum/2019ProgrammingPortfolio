class Rock {
  // Member Variables
  int x, y, r;   
  float health, spd, dir;
  color c1;
  boolean alive;

  //Constructor
  Rock(int x, int y, int r) {
    this.x = x;
    this.y = y;
    this.r = r;
    c1 = color(160);
    health = 100.0;
    spd = random(5, 15);
    dir = 0;
    alive = true;
  }

  void move () {
    y+= spd;
  }

  boolean reachedBottom() {
    if (y > height + r*4) {
      return true;
    } else {
      return false;
    }
  }

  //Display Method
  void display() {
    if (alive) {
      fill(255, 33, 33);
    } else {
      if (health<10) {
        fill(255, 255, 0);
      } else {
        fill(c1-health);
      }
    }
    fill(c1);
    ellipse(x, y, r, r);
  }
}
