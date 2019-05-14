class Laser {
  // Member Variables
  int x, y, w, h, spd;
  float dir, dmg;
  color c;
  boolean active;
  float r;

  // Constructor
  Laser(int x, int y) {
    r = 4;
    this.x = x;
    this.y = y;
    w = 4;
    h = 10;
    spd = 10;
    c = color(255,0,0);
    active = true;
  }
  // Display Method
  void display() {
    fill(c);
    for (int i = 2; i < r; i++ ) {
      rectMode(CENTER);
      rect(x, y, w, h);
    }
  }

  void fire() {
    y -= spd;
  }

  boolean reachedTop() {
    if (y<0+h) {
      return true;
    } else {
      return false;
    }
  }
}
