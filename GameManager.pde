class GameManager {
  boolean active;
  boolean over;
  int points;
  Timer timer;
  String msg;
  boolean quit;
  
  GameManager() {
    active = false;
    over = false;
    points = 0;
    timer = new Timer(30);
    msg = "";
    quit = false;
  }
  
  void startGame() {
    active = true;
    over = false;
    points = 0;
    quit = false;
    timer.start();
  }
  
  void quitGame() {
    active = false;
    over = true;
    quit = true;
    msg = "Done already?";
  }
  
  void update() {
    if (active) {
      timer.update();
      if (timer.isFinished()) {
        active = false;
        over = true;
        msg = getMsg();
      }
    }
  }
  
  void addPoints(int num) {
    int earned = calc(num);
    points += earned;
  }
  
  int calc(int num) {
    switch(num) {
      case 2: return 40;
      case 3: return 90;
      case 4: return 160;
      case 5: return 250;
      case 6: return 360;
      case 7: return 490;
      case 8: return 640;
      case 9: return 810;
      case 10: return 1000;
      case 11: return 1210;
      case 12: return 1440;
      case 13: return 1690;
      case 14: return 1960;
      case 15: return 2250;
      case 16: return 2560;
      case 17: return 2890;
      case 18: return 3240;
      case 19: return 3610;
      case 20: return 4000;
      default: return num > 20 ? 4000 : 0;
    }
  }
  
  String getMsg() {
    String[] msgs = {
      "Stellar journey complete!",
      "Your constellations shine bright!",
      "The stars remember your path!",
      "A cosmic adventure!",
      "You've mapped the heavens!",
      "Beautiful stargazing!"
    };
    return msgs[int(random(msgs.length))];
  }
  
  void displayHUD() {
    timer.display(width - 10, 20);
    fill(255);
    textAlign(RIGHT);
    textSize(12);
    text("Points: " + points, width - 10, 35);
    
    textAlign(CENTER);
    textSize(12);
    text("Enter to save   |   R to reset   |   Q to quit", width/2, height - 20);
  }
  
  void displayStart() {
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("Star Connector", width/2, height/2 - 50);
    
    textSize(16);
    text("Connect stars to form constellations", width/2, height/2);
    text("You have 30 seconds!", width/2, height/2 + 30);
    
    noStroke();
    fill(200, 50, 50);
    rect(width/2 - 75, height/2 + 80, 150, 50, 10);
    fill(255);
    textSize(20);
    text("Start Game", width/2, height/2 + 105);
  }
  
  void displayEnd() {
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(28);
    text(msg, width/2, height/2 - 50);
    
    textSize(24);
    text("Final Score: " + points, width/2, height/2);
    
    noStroke();
    fill(200, 50, 50);
    rect(width/2 - 75, height/2 + 80, 150, 50, 10);
    fill(255);
    textSize(20);
    text("Start Again", width/2, height/2 + 105);
  }
  
  boolean buttonClicked(float mx, float my) {
    return mx > width/2 - 75 && mx < width/2 + 75 && 
           my > height/2 + 80 && my < height/2 + 130;
  }
}
