
Branch seed;
ArrayList<Branch> branches;

float ANGLE;
int COUNTER;
float scal; //increase scal to decrease the tree size

void setup() {
  scal = 6;
  ANGLE = radians(32);

  branches = new ArrayList<Branch>();
  seed = new Branch(width/2, height, 0, 0);
  branches.add(seed);

  fullScreen();
  COUNTER = 0;
}

void draw() {
  background(255);
  translate(width/2, height);
  seed.show();
}

void keyPressed() {
  println(keyCode);
  if (keyCode == 27 || keyCode == 10) {
    exit();
  }

  if (keyCode == 39) {
    if (COUNTER < 16) {
      int limit = branches.size();
      for (int i = 0; i < limit; i++) {
        if (branches.get(i).leaf) {
          branches.get(i).makeMore();
        }
      }
      COUNTER++;
    }
  }

  if (keyCode == 37) {
  }
}
