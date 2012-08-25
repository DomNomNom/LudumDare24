class Player extends Mover {
  PVector target;

  //float movementSpeed = .2;
  float angle;
  
  color colour = #00FF00;
  
  float movePeriod = 100;

  Player(int x, int y) {
    super(x, y);
    pos_x = x;
    pos_y = y;
    target = new PVector(0,0);
    groups = new group[] {group.game, group.player};
    drawLayer = layer.player;
    animation = resources.animations.get("player");
  }


  void shoot() {
    /*
    if (updating) {
      // spawn a bullet
      engine.addEntity(new Bullet(pos, angle));

      // play the shooting sound
      resources.sounds.get("shot").rewind();
      resources.sounds.get("shot").play();
    }
    */
  }

  void update(float dt) {
    vel.x = input.control.x; // deep copy as we don't want to modify input.
    vel.y = input.control.y;

    //target.x = input.mousePos.x;
    //target.y = input.mousePos.y;
    //angle = atan2(target.y - pos.y, target.x - pos.x);

    //animation.update(dt);
    timeElapsed += dt;
    while (timeElapsed > movePeriod) {
      timeElapsed -= movePeriod;

      int step_x = (int)input.control.x;
      int step_y = (int)input.control.y;
      if (step_x == 0 && step_y == 0) continue;

      int target_x = pos_x + step_x;
      int target_y = pos_y + step_y;
      engine.grid.move(this, pos_x, pos_y, target_x, target_y);
      pos_x = target_x;
      pos_y = target_y;
    }
  }

  void draw() {
    fill(colour);
    //stroke(255, 100);
    //line(pos.x, pos.y, target.x, target.y);
    ellipse(.5,.5,.8,.8);
  }
  
  String toString() {
    return "Player(" + pos_x +", "+ pos_y +")";
  }
}
