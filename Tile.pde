

class Tile {
  List<Entity> container = new ArrayList<Entity>();
  
  int x, y;
  
  public Tile(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void draw() {
    PVector ts = engine.grid.tileSize;
    pushStyle();
    pushMatrix();
      translate(ts.x*x, ts.y*y);
      scale(ts.x, ts.y);
      rectMode(CORNER);
      for (Entity e : container)
        e.draw();
    popMatrix();
    popStyle();
  }
}
