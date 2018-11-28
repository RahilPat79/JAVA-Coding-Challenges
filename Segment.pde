class Segment{
  PVector a;
  float len;
  float angle;
  float selfAngle;
  
  float t;// xoff; // = random(1000);
  
  PVector b;
  
  Segment parent = null;
  Segment child = null;
  
  
  void calculateB(){
  float dx = len * cos(angle);
  float dy = len * sin(angle);
  b = new PVector(a.x+dx, a.y+dy);
  
  }
  
  Segment(Segment parent_, float len_, float angle_, float t_){
  parent = parent_;
  a = parent.b.copy();
  len = len_;
  angle = angle_;
  selfAngle = angle;
  calculateB();
  t =t_;
  
  }
  
  
  
  Segment(float x, float y, float len_, float angle_, float t_){
  a = new PVector(x,y);
  len = len_;
  angle = angle_;
  calculateB();
  parent = null; 
  t = t_;
  }
  
  void wiggle(){
    float max = + 0.4;
    float min = -0.4;
    selfAngle = map(noise(t),0,1,max,min);
    t += 0.01;
    //selfAngle = selfAngle +0.01;
    
  }
  
  void update(){
    angle = selfAngle;
    if(parent != null){
      a = parent.b.copy();
      angle += parent.angle;
    }else{
      angle += - PI/2;
    }
  
  calculateB();
  
  
  }

  void show(){
  stroke(255);
  strokeWeight(4);
  line(a.x,a.y,b.x,b.y);
    
  }

}
