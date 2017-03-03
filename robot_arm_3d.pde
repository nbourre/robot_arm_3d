Segment arm;

boolean btnLeftActive = false;
boolean btnRightActive = false;


void setup(){
  size(800, 600, P3D);
  
  arm = new Segment();
  arm.attachChild(new Segment());
}

void draw(){
  background(0);
  lights();
  translate (width / 2, height / 2, 100);
  arm.azimut += PI / 180.0;
  
  if (btnLeftActive) {
    arm.angle = map (mouseY, 0, height, -HALF_PI, HALF_PI);
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