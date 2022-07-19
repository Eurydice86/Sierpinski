int clicks = 0;

PVector triangle_a, triangle_b, triangle_c;
PVector nextPoint;
ArrayList<PVector> triangle = new ArrayList<PVector>();

void setup(){
  frameRate(60);
  fullScreen();
  //size(600,600);
  background(0);
  
  //triangle_a = new PVector(width/2, 5);
  //triangle_b = new PVector(5, height-5);
  //triangle_c = new PVector(width - 5, height-5);
  
  //triangle.add(triangle_a);
  //triangle.add(triangle_b);
  //triangle.add(triangle_c);
  
  
  //circle(triangle.get(0).x, triangle.get(0).y,1);
  //circle(triangle.get(1).x, triangle.get(1).y,1);
  //circle(triangle.get(2).x, triangle.get(2).y,1);
  
}


void draw(){
  if(clicks>3){
    for(int i=0; i<30; i++){
      strokeWeight(0);
      stroke(255);
      PVector randomPeak = pickRandomTrianglePeak();
      nextPoint = new PVector((randomPeak.x + nextPoint.x)/2, (randomPeak.y + nextPoint.y)/2);
      circle(nextPoint.x, nextPoint.y,1);
    }
  }
  else{
    for(PVector point : triangle)
      circle(point.x, point.y, 2);
  }
}



PVector pickRandomTrianglePeak(){
  int r = int(random(3));
  return triangle.get(r);
}

void mouseClicked(){
    if(clicks == 0){
      triangle_a = new PVector(mouseX, mouseY);
      triangle.add(triangle_a);
    }
    if(clicks == 1){
      triangle_b = new PVector(mouseX, mouseY);
      triangle.add(triangle_b);
    }
    if(clicks == 2){
      triangle_a = new PVector(mouseX, mouseY);
      triangle.add(triangle_a);
    }
    if(clicks == 3)
    nextPoint = new PVector(mouseX, mouseY);
    if(clicks > 3)
    return;
    
    clicks ++;
}
