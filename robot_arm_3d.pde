Segment arm;

boolean btnLeftActive = false;
boolean btnRightActive = false;


void setup(){
  size(800, 600, P3D);
  
  arm = new Segment();
  arm.setLimits(-HALF_PI, 0);
  arm.attachChild(new Segment());
  arm.child.len = arm.len * .75;
}

void draw(){
  background(0);
  lights();
  
  // Centrer la scène
  translate (width / 2, height / 2, 0);
  
  arm.azimut += PI / 180.0;
  
  if (btnLeftActive) {
    arm.setAngle(map(mouseY, 0, height, -HALF_PI, HALF_PI));
  }
  
  if (btnRightActive) {
    if (arm.child != null) {
      arm.child.angle = map (mouseX, 0, width, -HALF_PI, HALF_PI);
    }
  }
  
  arm.display();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    btnLeftActive =  true;
  }
  
  if (mouseButton == RIGHT) {
    btnRightActive = true;
  }
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    btnLeftActive =  false;
  }
  
  if (mouseButton == RIGHT) {
    btnRightActive = false;
  }
}