class Mover extends Entity {

  int pos_x;
  int pos_y;

  color colour = #FF00FF;

  float movePeriod = 1000;
  float timeElapsed = 0;

  Mover(int x, int y) {
    pos_x = x;
    pos_y = y;
  }

  void update(float dt) {
    timeElapsed += dt;
    while (timeElapsed > movePeriod) {

      int step_x = 1;
      int step_y = 0;

      int target_x = pos_x + step_x;
      int target_y = pos_y + step_y;
      engine.grid.move(this, pos_x, pos_y, target_x, target_y);
      pos_x = target_x;
      pos_y = target_y;
      
      timeElapsed -= movePeriod;
    }
  }
  
  void draw() {
    fill(colour);
    rect(0, 0, 1, 1);
  }

}
