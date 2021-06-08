import processing.sound.*;
SoundFile sonidofondo, beast, soothsayer, shogun, sweetChild;

int  di, di2, di3, di4, dia, di2a, di3a, di4a;
int pos1flecha1=400;
int pos1flecha2=500;
int pos1flecha3=600;
int pos1flecha4=700;
int pos2flecha1=800;
int pos2flecha2=900;
int pos2flecha3=1000;
int pos2flecha4=1100;
int puntaje;
int dificultad = 2;
int start =0;
int segundos=25;
int minutos=2;
int cent;
int enesc=1;
int colesc=0;
int colesc2=255;
PImage neg, fondo, tubo, menu, nar, ver, az, roj;
PFont texto;
void setup() {
  size(500, 600);
  sonidofondo= new SoundFile(this, "BucketheadPadmasana.wav");
  beast= new SoundFile(this, "numberbeast.wav");
  soothsayer= new SoundFile(this, "Soothsayer.wav");
  shogun= new SoundFile(this, "Shogun.wav");
  sweetChild= new SoundFile(this, "SweetChild.wav");
  nar=loadImage("esferanaranja.png");
  neg = loadImage("esferanegra.png");
  ver = loadImage("esferaverde.png");
  az = loadImage("esferaazul.png");
  roj = loadImage("esferaroja.png");
  fondo= loadImage("fondo.jpg");
  tubo= loadImage("tubo.png");
  menu=loadImage("menu.jpg");
  texto= loadFont("LucidaSans-48.vlw");
  textFont(texto, 28);
  sonidofondo.loop();
  beast.loop();
  soothsayer.loop();
  shogun.loop();
  sweetChild.loop();
}
void draw() {
  beast.pause();
  soothsayer.pause();
  shogun.pause();
  sweetChild.pause();
  if (dificultad<2) {
    dificultad=5;
  }
  if (dificultad>5) {
    dificultad=2;
  }
  if (puntaje<1) {
    puntaje=1;
  }
  if (puntaje>218) {
    puntaje=218;
  }
  if (start==0) {
    sonidofondo.pause();
    sonidofondo.play();
    textAlign(CENTER);
    textSize(28);
    image(menu, 0, -50, width, height+100);
    fill(0);
    text("Press ENTER to start", width/2+12, height/2+1);
    fill(255);
    text("Press ENTER to start", width/2+10, height/2);
    fill(0);
    if (dificultad==2) {
      text("<Easy>", width/2+13, 143);
    } else if (dificultad==3) {
      text("<Medium>", width/2+13, 143);
    } else if (dificultad==4) {
      text("<Hard>", width/2+13, 143);
    } else if (dificultad==5) {
      text("<Legend>", width/2+13, 143);
    }
  }
  if (start==1) {
    cent--;
    if ((cent%60)==0) {
      segundos--;
    }
    if ((segundos%60)==0) {
      minutos--;
    }
    if (segundos==0) {
      segundos=59;
    }
    if (minutos==0&&segundos==0&&puntaje>216) {
      start=3;
    } else if (minutos==0&&segundos==1) {
      start=4;
    }
    println(segundos, minutos);
    sonidofondo.pause();
    if (dificultad==2) {
      sweetChild.pause();
      sweetChild.play();
    }
    if (dificultad==3) {
      shogun.pause();
      shogun.play();
    }
    if (dificultad==4) { 
      beast.pause();
      beast.play();
    }
    if (dificultad==5) {
      soothsayer.pause();
      soothsayer.play();
    }
    image(fondo, -50, 0);
    textAlign(CENTER);
    fill(255);
    textSize(15);
    ////////////////////
    image(neg, 76, 36, 56, 56);
    image(neg, 176, 36, 56, 56);
    image(neg, 276, 36, 56, 56);
    image(neg, 376, 36, 56, 56);
    ////////////////////flecha1////////
    pos1flecha1=pos1flecha1-dificultad; 
    pos2flecha1=pos2flecha1-dificultad;
    di=round(dist(100, 60, 100, pos1flecha1));
    dia=round(dist(100, 60, 100, pos2flecha1));
    image(ver, 75, pos1flecha1-25, 62, 62);
    image(ver, 75, pos2flecha1-25, 62, 62);
    /////////////////////flecha2///////
    pos1flecha2=pos1flecha2-dificultad;
    pos2flecha2=pos2flecha2-dificultad;
    di2=round(dist(200, 60, 200, pos1flecha2));
    di2a=round(dist(200, 60, 200, pos2flecha2));
    image(roj, 175, pos1flecha2-24, 55, 60);
    image(roj, 175, pos2flecha2-24, 55, 60);
    //////////////////////flecha3////////
    pos1flecha3=pos1flecha3-dificultad;
    pos2flecha3=pos2flecha3-dificultad;
    di3=round(dist(300, 60, 300, pos1flecha3));
    di3a=round(dist(300, 60, 300, pos2flecha3));
    image(az, 275, pos1flecha3-26, 65, 65);
    image(az, 275, pos2flecha3-26, 65, 65);
    //////////////////////flecha4/////////
    pos1flecha4=pos1flecha4-dificultad;
    pos2flecha4=pos2flecha4-dificultad;
    di4=round(dist(400, 60, 400, pos1flecha4));
    di4a=round(dist(400, 60, 400, pos2flecha4));
    image(nar, 375, pos1flecha4-26, 75, 65);
    image(nar, 375, pos2flecha4-26, 75, 65);
    ///////////puntaje/////////
    //////////////////////////////
    fill(255, 0, 0);
    text("Q", 100, 60);
    text("W", 200, 60);
    text("E", 300, 60);
    text("R", 400, 60);
    if (pos1flecha1<-50) {
      pos1flecha1=round(random(650, 1700));
      puntaje=puntaje-3;
    } else if (pos2flecha1<-50) {
      pos2flecha1=round(random(650, 1700));
      puntaje=puntaje-3;
    } else if (pos1flecha2<-50) {
      pos1flecha2=round(random(650, 1700));
      puntaje=puntaje-3;
    } else if (pos2flecha2<-50) {
      pos2flecha2=round(random(650, 1700));
      puntaje=puntaje-3;
    } else if (pos1flecha3<-50) {
      pos1flecha3=round(random(650, 1700));
      puntaje=puntaje-3;
    } else if (pos2flecha3<-50) {
      pos2flecha3=round(random(650, 1700));
      puntaje=puntaje-3;
    } else if (pos1flecha4<-50) {
      pos1flecha4=round(random(650, 1700));
      puntaje=puntaje-3;
    } else if (pos2flecha4<-50) {
      pos2flecha4=round(random(650, 1700));
      puntaje=puntaje-3;
    }

    /////////////tubo/////////// 
    strokeWeight(35);
    stroke(255);
    line(37, 195, 37, 413);
    stroke(0, 255, 0);
    line(37, 413-puntaje, 37, 413);
    image(tubo, 0, 150, 300, 300);
    strokeWeight(1);
    stroke(0);
    fill(0);
    text("'P 'ause", 60, 20);
  }
  /////////////GANAR-PERDER//////////
  if (start==4||start==3) {
    background(0);
    textSize(56);
    if (start==4) {
      text("GAME OVER", 250, 300);
    } else if (start==3) {
      text("CONGRATULATION", 250, 300);
    }
    textSize(26);
    text("press enter to back menu", 250, 400);
  }
  /////////PARTIDA EN PAUSA////////
  if(enesc<1){
    enesc=2;
  }
  if(enesc>2){
    enesc=1;
  }
  if(enesc==1){
    colesc=0;
    colesc2=255;
  }
  if(enesc==2){
    colesc=255;
    colesc2=0;
  }
  if(start==5){
    textAlign(CENTER);
    textSize(40);
    background(145,145,255);
    fill(colesc2,0,0);
    text("Cotinue",250,200);
    fill(colesc,0,0);
    text("Back To Menu",250,400);
  }
  
}
void keyPressed() {
  if (start==0&&keyCode==RIGHT) {
    dificultad++;
  } else if (start==0&&keyCode==LEFT) {
    dificultad--;
  }
  if (start==0&&keyCode==ENTER) {
    start=1;
  }
  if (start==1) {
    if (keyCode=='P'||keyCode=='p') {
      start=5;
    }
    if (keyCode== 'q'||keyCode== 'Q') {
      if (di<=30) {
        pos1flecha1=round(random(650, 1700));
        puntaje=puntaje+2;
      } else if (dia<=30) {
        pos2flecha1=round(random(650, 1700));
        puntaje=puntaje+2;
      } else {
        puntaje=puntaje-3;
      }
    }
    if (keyCode== 'w'||keyCode== 'W') {
      if (di2<=30) {
        pos1flecha2=round(random(650, 1700));
        puntaje=puntaje+2;
      } else if (di2a<=30) {
        pos2flecha2=round(random(650, 1700));
        puntaje=puntaje+2;
      } else {
        puntaje=puntaje-3;
      }
    }
    if (keyCode== 'e'||keyCode== 'E') {
      if (di3<=30) {
        pos1flecha3=round(random(650, 1700));
        puntaje=puntaje+2;
      } else if (di3a<=30) {
        pos2flecha3=round(random(650, 1700));
        puntaje=puntaje+2;
      } else {
        puntaje=puntaje-3;
      }
    }
    if (keyCode== 'r'||keyCode== 'R') {
      if (di4<=30) {
        pos1flecha4=round(random(650, 1700));
        puntaje=puntaje+2;
      } else if (di4a<=30) {
        pos2flecha4=round(random(650, 1700));
        puntaje=puntaje+2;
      } else {
        puntaje=puntaje-3;
      }
    }
  }
  if (start==4||start==3&&keyCode==ENTER) {
    start=0;
    minutos=1;
    segundos=45;
    puntaje=0;
    pos1flecha1=400;
    pos1flecha2=500;
    pos1flecha3=600;
    pos1flecha4=700;
    pos2flecha1=800;
    pos2flecha2=900;
    pos2flecha3=1000;
    pos2flecha4=1100;
  }
  if (start==5&&enesc==2&&keyCode==ENTER) {
    start=0;
    minutos=1;
    segundos=45;
    puntaje=0;
    pos1flecha1=400;
    pos1flecha2=500;
    pos1flecha3=600;
    pos1flecha4=700;
    pos2flecha1=800;
    pos2flecha2=900;
    pos2flecha3=1000;
    pos2flecha4=1100;
  }else if(start==5&&enesc==1&&keyCode==ENTER){
    start=1;
  }
  if(start==5&&keyCode==UP){
    enesc--;
  }else if(start==5&&keyCode==DOWN){
    enesc++;
  }
}
