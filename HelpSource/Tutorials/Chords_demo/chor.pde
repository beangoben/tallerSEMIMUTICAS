class Chord {
  Particle end;
  Particle start;
  Vector p;
  Vector s;
  ParticleSystem physics;
  int n=10;
  float t=0.0;
  float ampC = 120.0;
  boolean sinus = false;

  float lengthX;
  float lengthY;
  float dist;
  
  color col;

  Chord(ParticleSystem physics, float ix, float iy, float fx, float fy) {
    this.physics = physics;

    float x1 = ix;
    float y1 = iy;
    float x2 = fx;
    float y2 = fy;

    end=physics.makeParticle(1.0, x1, y1, 0);
    end.makeFixed();

    start=physics.makeParticle(1.0, x2, y2, 0);
    start.makeFixed();
    p=new Vector();
    s=new Vector();

    p.add(start);
    for (int i=1; i < (n-1); i++) {
      p.add( physics.makeParticle(1.0, lerp(x1, x2, i/(float)(n-1) ), lerp(y1, y2, i/(float)(n-1) ), 0.0 ));
    }
    p.add(end);

    float d= dist(x1, y1, x2, y2)/(float)(n-1);

    for (int i=0; i < (n-1); i++) {
      Particle p1=(Particle)p.get(i);
      Particle p2=(Particle)p.get(i+1);

      s.add( physics.makeSpring(p1, p2, 1.0, 0.05, d));
    }

    lengthY = end.position().y() - start.position().y();
    lengthX = end.position().x() - start.position().x();
    dist    = dist(start.position().x(), start.position().y(), end.position().x(), end.position().y())/(float)(n-1);
  }

  void draw() {
    stroke(col);
    noFill();
    float x1 = start.position().x();
    float x2 = end.position().x();
    float y1 = start.position().y();
    float y2 = end.position().y();
    float angle = atan2(y2 - y1, x2 - x1 );

    Vec2D[] handles=new Vec2D[n];
    for (int i = 0; i< n; i++) {
      Particle p1=(Particle)p.get(i);
      handles[i]=new Vec2D(p1.position().x(), p1.position().y());
    }

    Spline2D spline=new Spline2D(handles);
    java.util.List vertices=spline.computeVertices(8);

    beginShape();
    strokeWeight(10);
    for (int i=0; i < vertices.size();i++ ) {
      Vec2D v=(Vec2D)vertices.get(i);
      vertex(v.x, v.y);
    }
    endShape();

//    line(x1, y1, x2, y2);
 //   fill(255, 0, 0);
  }

  void update() {
    t += freqOSC/5;
    float angle= PI + atan2(lengthY, lengthX );

    for (int i=1; i < (n-1); i++) {
      Particle p1 = (Particle)p.get(i);
      float amplitud =  (ampOSC*80);
      float addX = (amplitud) * sin(i*(ampOSC + freqOSC ) + t) * sin(angle + freqOSC);
      float addY = (amplitud) * sin(i*(ampOSC + freqOSC) + t) * cos(angle + freqOSC);
      p1.position().add( addX, addY, 0.0);
    }

    for (int i=1; i < (n-1); i++) {
      Spring ss=(Spring)s.get(i);
      ss.setRestLength(dist);
    }
  }
  
  void setColor(color col){
   this.col  =col; 
  }
}

