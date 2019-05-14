//MakeAFace
//9/17/18
//Connor Kendell

void setup() {
  size(500, 500);
  background(255);
  frameRate(1);
}
void draw() {
  background(255);
  drawHead();
  drawEyes();
  drawMouth();
  drawNose();
}

void mouseClicked() {
  saveFrame("line-######.png");
}

void drawHead() {
  fill(255, random(200, 230), random(22, 200));
  ellipse(width/2, height/2, random(width*0.55, width*0.75), random(height*0.8, height*0.99));
}

void drawMouth() {
  noFill();
  strokeWeight(random(2, 6));
  bezier(random(280, 320), random(400, 430), random(100, 120), random(400, 450), random(225, 280), random(340, 360), random(150, 310), random(345, 380));
}

void drawEyes() {
  fill(255);
  ellipse(random(170, 180), random(145, 170), random(width*0.1, width*0.2), random(height*0.1, height*0.3));
  ellipse(random(315, 330), random(145, 170), random(width*0.1, width*0.2), random(height*0.1, height*0.3));
  fill(random(150,255),random(10,230));
  ellipse(175, 150, 20,30);
}

void drawNose() {
  noFill();
  bezier(random(230, 260), random(310, 335), random(140, 165), random(310, 340), random(215, 280), random(160, 210), random(230, 260), random(150, 160));

}
