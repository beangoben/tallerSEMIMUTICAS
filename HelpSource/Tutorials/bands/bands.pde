
float smoothStep = 0.05;
int stepX;

void setup() {
  size(1024, 768);
  smooth(8);

  oscSetup();

  stepX = int(width*smoothStep);

  println(stepX);
}



void draw() {
  noStroke();
  fill(255, 20);
  rect(0, 0, width, height);

  if (onset) {
    stroke(0);
    onset = false;
  }
  else {
    stroke(amp*10 + 100, amp*10 + 100, 30*(freq/width));
  }
  strokeWeight(constrain(amp*50, 0, 20));
  line(freq + 100, 0, freq + 100, height);

  println(freq);
}




void keyPressed() {
  if (key == 'a') {
    printOSCMessage = !printOSCMessage;
  }
}

