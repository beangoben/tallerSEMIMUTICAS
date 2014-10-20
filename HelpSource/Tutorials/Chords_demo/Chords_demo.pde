import traer.physics.*;
import java.util.Vector;
import toxi.geom.*;

ParticleSystem physics;
Chord mid;
Chord up;
Chord bottom;

boolean moveEnd=false;

void setup()
{
  size( 1024, 768 );
  smooth();
  stroke( 0 );
  background( 255 );
  physics = new ParticleSystem( 0.0f, 0.05f );

  //CHORDS
  mid    = new Chord(physics, 0, height/2, width, height/2);
  up     = new Chord(physics, 0, 200, width, 200);
  bottom = new Chord(physics, 0, height/2 + 200, width, height/2 + 200);
  
    oscSetup();
}

void draw()
{
  background( 255 );		
  physics.tick();


  mid.update();
  mid.draw();

  up.update();
  up.draw();

  bottom.update();
  bottom.draw();
}

void keyPressed() {

  if (key =='a') {
    moveEnd=!moveEnd;
  }

  if (key =='s') {
    mid.sinus=!mid.sinus;
    bottom.sinus=!bottom.sinus;
    up.sinus=!up.sinus;
  }
}

