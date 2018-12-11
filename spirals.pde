float ya = sqrt(5.00)/6.00;
color bg = 0;
PVector st;
float teta = 10*ya;
float curPoint, lastPoint;
PImage scrShot;

void setup() {
  size(1000, 800);
  background(bg);
  noFill();
  colorMode(HSB, 360, 100, 100, 100);

  translate(width/2, height/2);
  st = new PVector (random(width), random(height));
  curPoint = 0.0;
  lastPoint = 0.0;
}

void draw() {
  pushMatrix();
  strokeWeight(random(1.8, 2.8));
  stroke(int(frameCount/20) % 360, random(60, 100), random(60, 100), 60);
  //noStroke();
  fill(int(frameCount/20) % 360, random(60, 100), random(60, 100), 50);
  curPoint += sqrt(2)/3;
  translate(st.x, st.y);
  rotate(teta);
  ellipse(curPoint +8, curPoint +8, 30, 20);
  line (0.0, 0.0, curPoint, curPoint);
  lastPoint = curPoint;
  teta += ya/8;
  popMatrix();

  if (curPoint > width/2) {
    lastPoint = 0.0;
    curPoint = 0.0;
    st.x = random(width);
    st.y = random(height);
    if (frameCount % 2 == 0)
      teta = 0;
    else
      teta = PI;

    fill(0, 0, 0, 6);
    noStroke();
    rect(0, 0, width, height);
  }
}

void keyPressed() {
  if (key == 's' || key == 'S' || key == 'p' || key == 'P') {
    int numR = int(random(5000));
    String fname="snapshot/pir_" + year() + month() + day() + "_" + frameCount +"_" + numR + ".png";
    scrShot=get(0, 0, width, height);
    scrShot.save(fname);
  }
   if (key == 'n' || key == 'N') {
   background(bg);
   redraw();
  }
}
