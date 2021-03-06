static float movePeriod = 200;


class Mover extends Entity {

  int pos_x;
  int pos_y;
  
  int vel_x;
  int vel_y;

  color colour = #FF00FF;

  float timeElapsed = 0;

  Mover(int x, int y, int v_x, int v_y) {
    pos_x = x;
    pos_y = y;
    vel_x = v_x;
    vel_y = v_y;
    pushStyle();
    //colorMode(HSB, 100);
    //colour = color(random(100), 200, 200);
    
    //colorMode(RGB, 3);
    //colour = color(v_x+1, v_y+1, 2);
    popStyle();
  }

  void update(float dt) {
    timeElapsed += dt;
    while (timeElapsed >= movePeriod) {
      step();
      timeElapsed -= movePeriod;
    }
  }
  
  void step() {
    int target_x = pos_x + vel_x;
    int target_y = pos_y + vel_y;
    engine.grid.move(this, pos_x, pos_y, target_x, target_y);
    pos_x = target_x;
    pos_y = target_y;
  }
  
  void draw() {
    fill(colour);
    rect(0, 0, 1, 1);
  }

}
