public class Node {
  private int i;
  private int j;
  private int w;
  private int he;
  private float f;
  private int g;
  private float h;
  private ArrayList<Node> neighbors = new ArrayList();
  private Node parent;
  boolean wall;

  public Node(int i, int j, int w, int he) {
    this.i = i;
    this.j = j;
    this.w = w;
    this.he = he;
    this.f = 0;
    this.g = 0;
    this.h = 0;
    this.parent = null;
    this.wall = decideWall();
  }

  public boolean decideWall() {
    if (random(1)<0.4)
      return true;
    else
      return false;
  }

  public void show(color colour) {
    fill(colour);
    if (this.wall) {
      fill(0);
    }
    noStroke();
    rect(this.i*w, this.j*he, w-1, he-1);
  }

  public void addNeighbors(Node[][] grid) {
    if (this.i < grid[0].length - 1)
      this.neighbors.add(grid[this.i + 1][this.j]);

    if (this.i > 0)
      this.neighbors.add(grid[this.i - 1][this.j]);

    if (this.j < grid.length - 1)
      this.neighbors.add(grid[this.i][this.j + 1]);

    if (this.j > 0)
      this.neighbors.add(grid[this.i][this.j - 1]);

    //Diagonales
    if (this.i > 0 && this.j > 0)
      this.neighbors.add(grid[this.i - 1][this.j - 1]);

    if (this.i > 0 && this.j < grid.length-1)
      this.neighbors.add(grid[this.i - 1][this.j + 1]);

    if (this.i < grid[0].length-1 && this.j > 0)
      this.neighbors.add(grid[this.i + 1][this.j - 1]);

    if (this.i < grid[0].length-1 && this.j < grid.length-1)
      this.neighbors.add(grid[this.i + 1][this.j + 1]);
  }

  public void setF(float f) {
    this.f = f;
  }

  public void setG(int g) {
    this.g = g;
  }

  public void setH(float h) {
    this.h = h;
  }

  public void setParent(Node parent) {
    this.parent = parent;
  }

  public void setWall(boolean wall) {
    this.wall = wall;
  }

  public float getF() {
    return this.f;
  }

  public int getG() {
    return this.g;
  }

  public float getH() {
    return this.h;
  }

  public int getI() {
    return this.i;
  }

  public int getJ() {
    return this.j;
  }

  public Node getParent() {
    return this.parent;
  }

  public boolean isWall() {
    return this.wall;
  }

  public boolean hasParent() {
    if (this.parent == null)
      return false;
    else
      return true;
  }

  public ArrayList<Node> getNeighbors() {
    return this.neighbors;
  }
}
