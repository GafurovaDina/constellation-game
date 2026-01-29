class Star {
  float x;  // Position relative to the sky
  float y;
  float r;  // Size
  boolean selected;
  int index; // Unique identifier
  
  Star(float x, float y, float r, int index) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.selected = false;
    this.index = index;
  }
  
  // Display star at position adjusted for sky offset
  void display(float skyOffsetX, float skyOffsetY) {
    float screenX = x - skyOffsetX;
    float screenY = y - skyOffsetY;
    
    // Only draw if visible in window
    if (screenX >= -20 && screenX <= width + 20 && 
        screenY >= -20 && screenY <= height + 20) {
      noStroke();
      
      if (selected) {
        fill(255, 255, 100); // Yellow for selected
        ellipse(screenX, screenY, r * 3, r * 3);
      } else {
        fill(255);
        ellipse(screenX, screenY, r, r);
      }
    }
  }
  
  // Check if mouse is over star (accounting for sky offset)
  boolean isMouseOver(float mx, float my, float skyOffsetX, float skyOffsetY) {
    float screenX = x - skyOffsetX;
    float screenY = y - skyOffsetY;
    return dist(mx, my, screenX, screenY) <= max(r * 2, 15);
  }
  
  // Check if star is currently visible in window
  boolean isVisible(float skyOffsetX, float skyOffsetY) {
    float screenX = x - skyOffsetX;
    float screenY = y - skyOffsetY;
    return screenX >= -20 && screenX <= width + 20 && 
           screenY >= -20 && screenY <= height + 20;
  }
  
  void select() {
    selected = true;
  }
  
  void unselect() {
    selected = false;
  }
}
