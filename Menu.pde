class Menu extends Entity {

  Menu() {
    size = new PVector(width, height);
    groups = new group[] {group.menu};
    drawLayer = layer.menu;
  }
  
  void draw() {
    // game label
    fill(250);
    textFont(resources.fonts.get("pauseLabel"), 48);
    text("Pink Swarm Evolution", center.x, .8*center.y);
    
    textFont(resources.fonts.get("pauseLabel"), 26);
    text("Try make something pretty\nwithout summoning the pink swarm", center.x, 1.1*center.y);
    
    text("Press Spacebar", center.x, 1.7*center.y);
  }
}
