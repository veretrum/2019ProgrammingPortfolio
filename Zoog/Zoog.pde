void setup(){
  //Set the size of the window
  size(200,200);
}

void draw() {
  ///background(255);
  drawZoog(100,100);
  drawZoog(mouseX, mouseY);
  drawZoog(int(random(width)),int(random(height)));
}


void drawZoog(int x, int y){
ellipseMode(CENTER);
  rectMode(CENTER);
  
  // Body
  stroke(0);
  fill(random(150,255),random(150,255),random(150,255));
  rect(x,y,20,100);
  
  // Head
  stroke(0);
  fill(random(150,255),random(150,255),random(150,255));
  ellipse(x,y-30,60,60);
  
  // Eyes
  fill(255);
  ellipse(x-15,y-30,16,32); //Left eye
  ellipse(x+15,y-30,16,32); //Right eye
  
  //Mouth
  line(x-5,y-20,x+5,y-20);
  
  // Legs
  stroke(0);
  line(x+12,y+50,x+30,y+80);
  line(x-12,y+50,x-30,y+80);
}
