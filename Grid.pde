
class Grid extends Entity {

  int wd;
  int ht;
  
  static final int shade = 60;
  color colour = color(shade, shade, shade);
  
  Tile[] tiles;
  
  PVector tileSize;
  
  Grid(int tilesX, int tilesY) {
    drawLayer = layer.grid;
    wd = tilesX;
    ht = tilesY;
    
    tileSize = new PVector(width/(float)wd,  height/(float)ht);
    tiles = new Tile[wd*ht];
    for (int i=0; i<wd*ht; ++i)
      tiles[i] = new Tile();
    
  }
  
  void update(float dt) {
  }
  
  void draw() {
    stroke(colour);
    for (int x=0; x<width;  x+=tileSize.x)  line(x, 0, x, height);
    for (int y=0; y<height; y+=tileSize.y)  line(0, y, width, y);
  }
}
