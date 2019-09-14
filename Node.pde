public class Node {
  private int i;
  private int j;
  private int w;
  private int he;
  private int f;
  private int g;
  private int h;
  private ArrayList<Node> neighbors = new ArrayList();

  public Node(int i, int j, int w, int he) {
    this.i = i;
    this.j = j;
    this.w = w;
    this.he = he;
    this.f = 0;
    this.g = 0;
    this.h = 0;
  }

  public void show(color colour) {
    fill(colour);
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
  }
  
  public void setG(int g) {
    this.g = g;
  }

  public int getF() {
    return this.f;
  }
  
  public int getG() {
    return this.g;
  }
  
  public ArrayList<Node> getNeighbors(){
    return this.neighbors;
  }
}
