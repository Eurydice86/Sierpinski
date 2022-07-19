int shapeSidesN = 0;
boolean shapeDone;

PVector triangle_a, triangle_b, triangle_c, triangle_d;
PVector nextPoint;
ArrayList<PVector> triangle = new ArrayList<PVector>();

void setup(){
  shapeDone = false;
  frameRate(60);
  fullScreen();
  //size(600,600);
  background(0);
}


void draw(){
  if(shapeDone){
    for(int i=0; i<1000; i++){
      strokeWeight(0);
      stroke(255);
      PVector randomPeak = pickRandomPeak();
      nextPoint = new PVector((randomPeak.x + nextPoint.x)/2, (randomPeak.y + nextPoint.y)/2);
      circle(nextPoint.x, nextPoint.y,1);
    }
  }
  else{
    for(PVector point : triangle)
      circle(point.x, point.y, 2);
  }
}


PVector pickRandomPeak(){
  int r = int(random(shapeSidesN));
  println(r);
  return triangle.get(r);
}

void mousePressed(){
  if(!shapeDone){
    if(mouseButton == LEFT){
      triangle_a = new PVector(mouseX, mouseY);
      triangle.add(triangle_a);
      shapeSidesN++;
    }
    else{
      nextPoint = new PVector(mouseX, mouseY);
      shapeDone = true;
    }
  }
}
