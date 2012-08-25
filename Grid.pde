
class Grid extends Entity {

  int wd;
  int ht;
  
  static final int shade = 60;
  color colour = color(shade, shade, shade);
  
  Map<Integer, Set<Mover>> tiles = new HashMap<Integer, Set<Mover>>();
  
  Queue<MoveAction> todo = new LinkedList<MoveAction>();
  
  PVector tileSize;
  
  Grid(int tilesX, int tilesY) {
    drawLayer = layer.grid;
    wd = tilesX;
    ht = tilesY;
    
    tileSize = new PVector(width/(float)wd,  height/(float)ht);
    /*
    tiles = new Tile[wd*ht];
    for (int x=0; x<wd; ++x)
      for (int y=0; y<ht; ++y)
        tiles[x+y*wd] = new Tile(x, y);
    */
  }
  
  void update(float dt) {
    for (Set<Mover> s : tiles.values())
      for (Mover e : s)
        e.update(dt);
    while (!todo.isEmpty())
      todo.poll().execute();
  }
  
  void draw() {
    for (Integer pos : tiles.keySet()) {
      pushStyle();
      pushMatrix();
        int x = pos % wd;
        int y = pos / wd;
        translate(x*tileSize.x, y*tileSize.y);
        scale(tileSize.x, tileSize.y);
        rectMode(CORNER);
        
        for (Mover e : tiles.get(pos))
          e.draw();
      popMatrix();
      popStyle();
    }
    
    stroke(colour);
    for (int x=0; x<width;  x+=tileSize.x)  line(x, 0, x, height);
    for (int y=0; y<height; y+=tileSize.y)  line(0, y, width, y);
  }
  
  void add(Mover e) {
    thingsAt(e.pos_x, e.pos_y).add(e);
  }
  
  Set<Mover> thingsAt(int x, int y) {
    Integer pos = pos(x, y);
    if (!tiles.containsKey(pos))
      tiles.put(pos, new HashSet<Mover>());
      
    return tiles.get(pos);
  }
  
  void move(Mover e, int from_x, int from_y, int to_x, int to_y) {
    todo.add(new MoveAction(e, from_x, from_y, to_x, to_y)); // TODO queue
  }
  
  Integer pos(int x, int y){
    return x + y*wd;
  }
  
  class MoveAction {
    Mover e;
    int from_x, from_y, to_x, to_y;
    
    MoveAction(Mover e, int from_x, int from_y, int to_x, int to_y) {
      this.e = e;
      this.from_x = from_x;
      this.from_y = from_y;
      this.to_x = to_x;
      this.to_y = to_y;
    }

    void execute() {
      Integer from = pos(from_x, from_y);
      Integer to   = pos(to_x,   to_y  );
      
      if (!tiles.containsKey(from) ||  !tiles.get(from).contains(e)) 
        println("OMG, you don't exist here!"); // TODO: proper error handling
      
      if (tiles.get(from).size() == 1  && !tiles.containsKey(to)) {
        // re-use our set on the other position
        tiles.put(to, tiles.get(from));
        tiles.remove(from);
      }
      else {
        if (!tiles.containsKey(to))
          tiles.put(to, new HashSet<Mover>());
        tiles.get(from).add(e);
        
        if (tiles.get(from).size() == 1)
          tiles.remove(from);
        else
          tiles.get(from).remove(e);
      }
    }
  }
}
