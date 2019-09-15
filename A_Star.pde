int columns = 50; //<>//
int rows = 50;
int w;
int h;
float distance;

ArrayList<Node> path = new ArrayList();
ArrayList<Node> openSet = new ArrayList();
ArrayList<Node> closedSet = new ArrayList();

Node currentNode;
Node[][] grid = new Node[columns][rows];
Node start;
Node end;

float heuristic(Node from, Node end) {
  distance = dist(from.getI(), from.getJ(), end.getI(), end.getJ());
  return distance;
}

void setup() {
  size(600, 600);
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
  start.setWall(false);
  end.setWall(false);

  openSet.add(start);
}

void draw() {
  if (openSet.size() > 0) {
    int lowestIndex = 0;
    for (int i = 0; i < openSet.size(); i++) {
      if (openSet.get(i).getF() < openSet.get(lowestIndex).getF()) {
        lowestIndex = i;
      }
    }

    currentNode = openSet.get(lowestIndex);

    if (currentNode == end) {   
      noLoop();
      print("Finished");
    }

    openSet.remove(currentNode);
    closedSet.add(currentNode);

    ArrayList<Node> neighbors = currentNode.getNeighbors();
    for (int i = 0; i < neighbors.size(); i++) {
      Node neighbor = neighbors.get(i);

      if (!closedSet.contains(neighbor) && !neighbor.isWall()) {
        int tempG = neighbor.getG() +1;

        boolean foundPath = false;
        if (openSet.contains(neighbor)) {
          if (tempG < neighbor.getG()) {
            neighbor.setG(tempG);
            foundPath = true;
          }
        } else {
          neighbor.setG(tempG);
          foundPath = true;
          openSet.add(neighbor);
        }

        //heuristic
        if (foundPath) {
          neighbor.setH(heuristic(neighbor, end));
          neighbor.setF(neighbor.getG() + neighbor.getH());
          neighbor.setParent(currentNode);
        }
      }
    }
  } else {
    noLoop();
    print("No solution");
    return;
  }
  background(0);

  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].show(color(255));
    }
  }
  
  path.clear();
  Node temp = currentNode;
  path.add(temp);
  while (temp.hasParent()) {
    path.add(temp.getParent());
    temp = temp.getParent();
  }

  for (int i = 0; i < path.size(); i++) {
    path.get(i).show(color(255, 0, 0));
  }
}
