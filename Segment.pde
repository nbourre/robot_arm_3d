class Segment {
  PVector location = new PVector();
  float angle = 0;
  float azimut = 0;
  
  float len = 100.0;
  float thickness = 10;
  float sizeRatio = 1;
  
  float lowerLimit = 0;
  float upperLimit = TWO_PI;
  
  Segment child;
  
  Segment () {
    
  }
  
  void attachChild(Segment child) {
    child.setLocation(len * sizeRatio / 2, 0, 0);
    this.child = child;
  }
  
  void setLocation (float x, float y, float z) {
    location.x = x;
    location.y = y;
    location.z = z;
  }
  
  void setAngle(float angle) {
    
    this.angle = angle;
    
    if (this.angle < lowerLimit) {
      this.angle = lowerLimit;
    }
    
    if (this.angle > upperLimit) {
      this.angle = upperLimit;
    }
  }
  
  void setLimits (float lower, float upper) {
    lowerLimit = lower;
    upperLimit = upper;
  }
  
  void update(float deltaTime) {
    
  }
  
  void display() {
    
    pushMatrix();
    
      translate (location.x, location.y, 0);
      rotateY(azimut);
      rotateZ(angle);
      
      translate(len * sizeRatio / 2, 0, 0);
      
      fill (200);
      noStroke();      
      box (len * sizeRatio, thickness * sizeRatio, thickness * sizeRatio);
      
      pushMatrix();
        fill (255, 200, 200);
        noStroke();
        translate (-len * sizeRatio / 2, 0, 0);
        sphere(thickness * sizeRatio);
      popMatrix();
      
      if (child != null) {
        child.display();
      }
    popMatrix();
  }
  
}