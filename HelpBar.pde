String hint = "";

class HelpBar extends Entity {

  float centerBarHeight;

  // some stats
  int clickCount = 0;
  int clickCountWhilePaused = 0;
  int restartCount = 0;
  boolean needsRestarting = false;
  float timeSinceCreation = 0;
  boolean pressedPause = false;

  HelpBar() {
    groups = new group[] {group.menu};

    size = new PVector(width, height);
    drawLayer = layer.menu;
    centerBarHeight = center.x/7;
    
  }


  void update(float dt) {
    timeSinceCreation += dt;
    if (needsRestarting)                        hint = "Press Enter to restart";
    else if (timeSinceCreation < 4000)          hint = "";  // wait for the demonstation
    else if (engine.gameState.currentState==state.paused && 2<clickCountWhilePaused) hint = "You can still place pink while paused";
    else if (clickCount < 3)                    hint = "Click to place pink";
    else if (!pressedPause)                     hint = "Press Spacebar to pause";
    else                                        hint = "";
  }

  void draw() {
    if ("".equals(hint))
      return;
    
    fill(0, 100);
    rect(center.x, 0.3*center.y, width, centerBarHeight);

    fill(250);
    textFont(resources.fonts.get("pauseLabel"), 26);
    text("Hint: " + hint, center.x, 0.3*center.y);
    
  }  
}
