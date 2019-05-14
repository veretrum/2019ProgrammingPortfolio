// SpaceShooter //<>//
// by Connor Kendell
// 12/3/18
// TODO:
Table tResults;
TableRow tr1;

ArrayList<Laser> lasers;
ArrayList<Rock> rocks;
Timer timer;
Timer puTimer;
Timer ticTimer;
int rockRate = 1000;
int level = 1;
int health = 100;
int rockCount = 0;
int pass = 0;
int score = 0;
boolean ticker = false;
boolean play = false;
String ticText = "";
String name = "Connor";
import processing.sound.*;
SoundFile laser;
SoundFile explosion;
SpaceShip s1;


void setup() {
  size(500, 500);
  tResults = loadTable("results.csv", "header");
  s1 = new SpaceShip(width/2, height/2, 10, color(128) );
  rocks = new ArrayList<Rock>();
  lasers = new ArrayList<Laser>();
  timer = new Timer(rockRate);
  timer.start();
  laser = new SoundFile(this, "laser.wav");
  explosion = new SoundFile(this, "explosion.wav");
  ticTimer = new Timer(2000);
}

void draw() {
  background(0);
  s1.display(mouseX, mouseY);

  // Level Handling 
  if (frameCount % 1000 == 10) {
    level++;
    ticText = "Level: " + level;
    ticker();
    rockRate-=50;
    timer.totalTime = rockRate;
  }



  // Add rocks based on timer
  if (timer.isFinished()) {
    rocks.add(new Rock(int(random(width)), -20, int(random(20, 70))));
    timer.start();
  }

  // Render Rocks
  for (int i = 0; i<rocks.size(); i++) {
    rocks.get(i).move();
    rocks.get(i).display();
    if (rocks.get(i).reachedBottom()) {
      rocks.remove(i);
    }
  }


  // Collision Detection
  for (int i = rocks.size()-1; i>=0; i--) {
    Rock rock = (Rock) rocks.get(i);
    rock.move();
    rock.display();
    if (rock.reachedBottom()) {
      rocks.remove(rock);
    }
    for (Laser l : lasers) {
      if (dist(l.x, l.y, rock.x, rock.y) < rock.r) {
        explosion.play();
        rock.health-=1;
      }
      if (rock.health<10) {
        rocks.remove(rock);
        score+=rock.r;
      }
    }
    if (dist(s1.x, s1.y, rock.x, rock.y) < s1.r) {
      if (rock.alive) {
        rocks.remove(rock);
      } else {
        rocks.remove(rock);
      }
    }
  }


  // Display and Dispose Lasers
  for (int i = lasers.size()-1; i>=0; i--) {
    lasers.get(i).fire();
    lasers.get(i).display();
    if (lasers.get(i).reachedTop()) {
      lasers.remove(i);
    }
  } //<>//
  if (ticker) { //<>//
    if (!ticTimer.isFinished()) { //<>//
      fill(255, 127); //<>//
      textSize(44);
      textAlign(CENTER);
      text(ticText, width/2, height/2);
    } else if (!ticTimer.isFinished() && health < 30) {
      fill(255, 127);
      textSize(44);
      textAlign(CENTER);
      text(ticText, width/2, height/2);
    }
  }
  infoPanel();
  
  if (health<1 || pass>10) {
    play = false;
    gameOver();
  } else {
    play = true;
  }
  
}

void infoPanel() {
  fill(150);
  textAlign(LEFT);
  textSize(14);
  text("Score: " + score, 10, height-75);
  text("Level: " + level, 10, height-60);
  text("Rocks: " + rockCount, 10, height-45);
  if (health<30) {
    fill(255,0,0);
  } else {
    fill(150);
  }
  text("Health: " + health, 10, height-30);
  if (pass>8) {
    fill(255, 0, 0);
  } else {
    fill(122);
  }
  text("Pass: " + pass, 10, height-15);
}

void gameOver() {
  background(0);
  textAlign(CENTER);
  fill(222);
  text("Git Gud", width/2, height/2);
  text("Final Score:" + score, width/2, height/2+20);
  text("You made it to level " + level, width/2, height/2+40);
  text("Targets: " + rockCount, width/2, height/2+60);
  text("Health: " + health, width/2, height/2+80);
  text("Rocks Passed: " + pass, width/2, height/2+100);
  TableRow newRow = tResults.addRow();
  newRow.setString("NAME", name);
  newRow.setString("SCORE", str(score));
  newRow.setString("LEVEL", str(level));
  newRow.setString("ROCKS", str(rockCount));
  newRow.setString("HEALTH", str(health));
  newRow.setString("PASS", name);
  saveTable(tResults, "data/results.csv");
  
  tResults.sort("SCORE");
  tr1 = tResults.getRow(tResults.getRowCount()-1);
  text("High Score: " + tr1.getString("SCORE"), width/2, height/2+140);
  noLoop();
}

void ticker() {
  ticTimer.start();
  ticker = true;
  if (ticTimer.isFinished()) {
    ticker = false;
  }
}

void mousePressed() {
  lasers.add(new Laser(s1.x, s1.y));
  //laser.play();
}

void keyPressed() {
  if (key == ' ') {
    lasers.add(new Laser(s1.x, s1.y));
  }
  //laser.play();
}

void updateDisplay() {
  fill(127, 127);
  rectMode(CENTER);
  rect(0, 0, width, 0);
}
