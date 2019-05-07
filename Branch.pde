class Branch {
  float x;
  float y;
  float level;
  float angle;

  float endx;
  float endy;

  float len;
  float wid;

  color col;
  boolean leaf;

  Branch leaf1;
  Branch leaf2;

  Branch(float x, float y, float level, float angle) {
    this.x = x;
    this.y = y;
    this.level = level;
    this.angle = angle;

    this.wid = 60 / (1 + this.level);
    this.len = height / scal * pow(0.9,this.level*2.5);
    
    this.col = color(180,0,0);
    //this.col = color(45, 87, 44);
    

    this.endx = this.x;
    this.endy = height/2;
    this.leaf = true;
  }

  void makeMore() {
    leaf1 = new Branch(this.endx, this.endy, this.level + 1, this.angle + ANGLE);
    leaf2 = new Branch(this.endx, this.endy, this.level + 1, this.angle - ANGLE);
    this.leaf = false;
    this.col = color(25,13,8);
    branches.add(leaf1);
    branches.add(leaf2);
  }

  void show() {
    strokeWeight(this.wid);
    stroke(this.col);
    rotate(this.angle);
    float ending = -this.len;
    //ellipseMode(RADIUS);
    //circle(0,ending,200);
    line(0, 0, 0, ending);
    translate(0, ending);
    rotate(-this.angle);
    if (!this.leaf) {
      this.leaf1.show();
      rotate(leaf1.angle);
      translate(0, leaf1.len);
      rotate(-leaf1.angle);
      this.leaf2.show();
      rotate(leaf2.angle);
      translate(0, leaf2.len);
      rotate(-leaf2.angle);
    }
  }
}
