class Star {
  float x;
  float y;
  float speedx;
  float speedy;
  float r;
  boolean selected;
  boolean frozen;
  
Star(float x, float y, float speedx, float speedy, float r) {
  this.x=x;
  this.y=y;
  this.speedx = speedx;
  this.speedy = speedy;
  this.r = r;
  this.selected = false;
  this.frozen = false;
}

void update() {
  if (frozen) return;
  x+= speedx;
  y+= speedy;
  
  if(x<0) x = width;
  if(x>width) x=0;
  if(y<0) y = height;
  if(y>height) y=0;
}

void display() {
  noStroke();
  
  if(selected) {
    fill(255);
    ellipse(x,y, r*4, r*4);
  } else {
    fill (255);
    ellipse(x,y, 4, 4);
  }
}

boolean isMouseOver(float mx, float my) {
  return dist(mx, my, x,y) <=r;
}

void onClick() {
  selected = true;
  frozen = true;
}
void unselect() {
  selected = false;
  frozen= false;
}
}
