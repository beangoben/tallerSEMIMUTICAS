import oscP5.*;
import netP5.*;
import java.nio.*;

//todo lo relacionado con osc
OscP5 oscP5;
NetAddress myRemoteLocation;

boolean printOSCMessage = false;

float freqOSC;
float ampOSC;

void oscSetup() {
  oscP5 = new OscP5(this, 32000);
  oscP5.plug(this, "ampResponse", "/amp");
  oscP5.plug(this, "onsetResponse", "/onset");
  oscP5.plug(this, "pitchResponse", "/pitch");
  oscP5.plug(this, "powerResponse", "/power");
}


/* Osc events reciever for not plugged messages */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  if (printOSCMessage && theOscMessage.isPlugged() == false) {
    print("### received an osc message.");
    print(" addrpattern: " + theOscMessage.addrPattern());
    println(" typetag: " + theOscMessage.typetag());
    theOscMessage.printData();
  }
}
/* Pluggable functions */
public void ampResponse(int id, float amp) {
  this.ampOSC = amp;

  if (amp > 0.4)
    bottom.setColor( getGoodColor());
  if (amp > 0.1 && amp < 0.2)
    mid.setColor( getGoodColor());
  if (amp > 0.3)
    up.setColor( getGoodColor());

  if (printOSCMessage)println("Amp:" + id + " " + amp);
}

public void onsetResponse(int id) {
  if (printOSCMessage)println("Onset:" + id);
}

public void pitchResponse(int id, float pitch) {
  freqOSC = map(pitch, 20, 18000, 0, 1);

  if (printOSCMessage)println("Pitch:" + id + " " + pitch);
}

public void powerResponse(int id, int nbands, byte[] data) {
  if (printOSCMessage)println("Power:" + id + " " + nbands);

  //Parse bytes to floats
  int offset=data.length-nbands*4;    
  ByteBuffer buffer = ByteBuffer.allocate(nbands*4);
  buffer.put(data, 0, 4);
  buffer.put(data, 4+offset, 4*(nbands-1)); //skip padding

  // println("[");
  // for (int i=0; i < nbands; i++) {
  //   print(buffer.getFloat(i*4)+",");
  // }  
  // println("]");
}

