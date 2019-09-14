int columns = 5;
int rows = 5;
int w;
int h;
Node[][] grid = new Node[columns][rows];

ArrayList<Node> openSet = new ArrayList();
ArrayList<Node> closedSet = new ArrayList();

Node start;
Node end;

void setup() {
  size(400, 400);
  w = width / columns;
  h = height / rows;

  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Node(i, j, w, h);
    }
  }
  
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].addNeighbors(grid);
    }
  }

  start = grid[0][0];
  end = grid[columns-1][rows-1];

  openSet.add(start);
}

void draw() {
  if (openSet.size() > 0) {
    //continue
    int lowestIndex = 0;
    for (int i = 0; i < openSet.size(); i++) {
      if (openSet.get(i).getF() < openSet.get(lowestIndex).getF()) {
        lowestIndex = i;
      }
    }

    Node currentNode = openSet.get(lowestIndex);

    if (openSet.get(lowestIndex) == end) {
      print("Finished.");
    }

    openSet.remove(currentNode);
    closedSet.add(currentNode);
    
    ArrayList<Node> neighbors = currentNode.getNeighbors();
    for (int i = 0; i < neighbors.size(); i++) {
      Node neighbor = neighbors.get(i);
      
      if(!closedSet.contains(neighbor)){
         int tempG = neighbor.getG() +1; 
      }
      
    }
    
    
  } else {
    //no solution
  }
  background(0);

  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].show(color(255));
    }
  }

  for (int i = 0; i < openSet.size(); i++) {
    openSet.get(i).show(color(0, 255, 0));
  }

  for (int i = 0; i < closedSet.size(); i++) {
    closedSet.get(i).show(color(255, 0, 0));
  } //<>//
}
