Star[] stars;
int n = 20;

void setup() {
  size(500, 500);
  stars = new Star[n];
  
  for (int i = 0; i < n; i++) { 
  float x = random(width);
  float y = random (height);
  float speedx = random (-0.2, 0.2);
  float speedy = random(-0.2, 0.2);
  float r = random(2,4);
  stars[i] = new Star (x,y, speedx, speedy,r);
  }
}

void draw() {
  background (10, 10, 30);
 for (int i=0; i<n; i++) {
   stars[i].update();
   stars[i].display();
 }
}

void mousePressed() {
  for (int i=0; i<n; i++) {
    if(stars[i].isMouseOver(mouseX, mouseY)) {
      stars[i].onClick();
      break;
    }
  }
}
  
