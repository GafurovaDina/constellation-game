Star[] stars;
ArrayList<Star> selectedStars = new ArrayList<Star>();
ArrayList<ArrayList<Star>> savedConstellations = new ArrayList<ArrayList<Star>>();
int totalStars = 100;

// Sky movement
float skyOffsetX = 0;
float skyOffsetY = 0;
float skySpeed = 0.5; // Pixels per frame
float skyWidth = 2000;  // Total sky size
float skyHeight = 1500;

void setup() {
  size(500, 500);
  stars = new Star[totalStars];
  
  // Create fixed constellation of stars across the larger sky
  for (int i = 0; i < totalStars; i++) { 
    float x = random(skyWidth);
    float y = random(skyHeight);
    float r = random(2, 6); // Varied star sizes
    stars[i] = new Star(x, y, r, i);
  }
}

void draw() {
  background(10, 10, 30);
  
  // Move the sky window (scrolling right and down)
  skyOffsetX += skySpeed;
  skyOffsetY += skySpeed * 0.3; // Slower vertical movement
  
  // Check if current selection should be cleared (if any star touches frame edge)
  if (selectedStars.size() > 0) {
    for (Star s : selectedStars) {
      if (isStarTouchingEdge(s)) {
        // Clear the selection
        for (Star star : selectedStars) {
          star.unselect();
        }
        selectedStars.clear();
        println("Selection cleared - star touched edge");
        break;
      }
    }
  }
  
  // Remove saved constellations that have moved completely out of frame
  for (int i = savedConstellations.size() - 1; i >= 0; i--) {
    ArrayList<Star> constellation = savedConstellations.get(i);
    boolean allOutOfFrame = true;
    
    for (Star s : constellation) {
      if (s.isVisible(skyOffsetX, skyOffsetY)) {
        allOutOfFrame = false;
        break;
      }
    }
    
    if (allOutOfFrame) {
      savedConstellations.remove(i);
      println("Saved constellation removed - moved out of frame");
    }
  }
  
  // Display all stars (only visible ones will actually draw)
  for (int i = 0; i < totalStars; i++) {
    stars[i].display(skyOffsetX, skyOffsetY);
  }
  
  // Draw saved constellations (in green)
  stroke(0, 255, 0); // Green for saved
  strokeWeight(2);
  for (ArrayList<Star> constellation : savedConstellations) {
    for (int i = 0; i < constellation.size() - 1; i++) {
      Star s1 = constellation.get(i);
      Star s2 = constellation.get(i + 1);
      
      float x1 = s1.x - skyOffsetX;
      float y1 = s1.y - skyOffsetY;
      float x2 = s2.x - skyOffsetX;
      float y2 = s2.y - skyOffsetY;
      
      line(x1, y1, x2, y2);
    }
  }
  
  // Draw lines between currently selected stars (in yellow)
  stroke(255, 255, 0); // Yellow
  strokeWeight(2);
  for (int i = 0; i < selectedStars.size() - 1; i++) {
    Star s1 = selectedStars.get(i);
    Star s2 = selectedStars.get(i + 1);
    
    // Calculate screen positions
    float x1 = s1.x - skyOffsetX;
    float y1 = s1.y - skyOffsetY;
    float x2 = s2.x - skyOffsetX;
    float y2 = s2.y - skyOffsetY;
    
    line(x1, y1, x2, y2);
  }
  
  // Display info in upper right
  fill(255);
  textAlign(RIGHT);
  text("Press Enter to save constellation", width - 10, 20);
  text("Press R to reset", width - 10, 40);
  text("Saved: " + savedConstellations.size(), width - 10, 60);
}

// Check if a star is touching or outside the edge of the frame
boolean isStarTouchingEdge(Star s) {
  float screenX = s.x - skyOffsetX;
  float screenY = s.y - skyOffsetY;
  
  return screenX <= 0 || screenX >= width || screenY <= 0 || screenY >= height;
}

void mousePressed() {
  for (int i = 0; i < totalStars; i++) {
    if (stars[i].isMouseOver(mouseX, mouseY, skyOffsetX, skyOffsetY) && 
        !stars[i].selected &&
        stars[i].isVisible(skyOffsetX, skyOffsetY)) {
      stars[i].select();
      selectedStars.add(stars[i]);
      break;
    }
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    // Reset current selection
    for (Star s : selectedStars) {
      s.unselect();
    }
    selectedStars.clear();
  }
  
  if (key == ENTER || key == RETURN) {
    // Save constellation if at least 2 stars are selected
    if (selectedStars.size() >= 2) {
      // Create a copy of the current selection and save it
      ArrayList<Star> constellation = new ArrayList<Star>(selectedStars);
      savedConstellations.add(constellation);
      
      // Clear current selection for next constellation
      selectedStars.clear();
      
      println("Constellation saved! Total saved: " + savedConstellations.size());
    }
  }
  
  // Manual controls for testing
  if (key == ' ') {
    skySpeed = (skySpeed == 0) ? 0.5 : 0; // Pause/unpause
  }
}
