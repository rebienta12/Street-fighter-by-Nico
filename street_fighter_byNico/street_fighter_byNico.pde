PImage fons;
PImage RyuGuardia;
PImage RyuPuno;
PImage RyuPatada;
PImage RyuBloqueo;
PImage Ryu;
PImage KenGuardia;
PImage KenPuno;
PImage KenPatada;
PImage KenBloqueo;
PImage Ken;

int IXrect;
int IYrect;
float IanchoBarra, IanchoBarraTotal;
float Ivida_total;
float Ivida_que_le_queda;
float Dvida_total;
float Dvida_que_le_queda;
int DXrect;
int DYrect;
float Dancho_de_barra=250;
float Dancho_de_barra_total;
int Posicio_Ryu;
int Reloj_Ryu;
int Posicio_Ken;
int Reloj_Ken;


void setup() {
  size(600, 250);
  fons=loadImage("fons.gif");
  RyuGuardia=loadImage("RyuGuardia.png");
  RyuPuno=loadImage("RyuPuño.png");
  RyuBloqueo=loadImage("RyuBloqueo.png");
  Ryu=RyuGuardia;
  RyuPatada=loadImage("RyuPatada.png");
  KenGuardia=loadImage("KenGuardia.png");
  KenPuno=loadImage("KenPuño.png");
  KenBloqueo=loadImage("KenBloqueo.png");
  Ken=KenGuardia;
  KenPatada=loadImage("kenPatada.png");
  IXrect=15;
  IYrect=5;
  IanchoBarraTotal=250;
  Ivida_total=250;
  Ivida_que_le_queda=Ivida_total;
  Dvida_total=250;
  Dvida_que_le_queda=Dvida_total;
  Dancho_de_barra_total=250;
  DYrect=5;
  DXrect=width/2;
  Dancho_de_barra=250;
  Posicio_Ryu=50;
  Reloj_Ryu=0;
  Posicio_Ken=500;
  Reloj_Ken=0;
}



void draw() {
  image(fons, 0, 0);
  dibujar_Ryu();
  dibujar_Ken();
  dibuixaBarres();
  Reloj_Ryu++;
  Reloj_Ken++;
}

void dibuixaBarres() {
  stroke(255, 255, 255);
  noFill();
  rect(IXrect, IYrect, 250, 25 );
  rect(DXrect, DYrect, 250, 25);
  noStroke();
  fill(255, 0, 0);
  rect(IXrect+1, IYrect+1, 249, 24 );
  fill(255, 0, 0);
  rect(DXrect+1, DYrect+1, 249, 24 );

  fill(255, 255, 0);

  IanchoBarra= IanchoBarraTotal*(Ivida_que_le_queda/Ivida_total );
  rect(IXrect+1, IYrect+1, IanchoBarra, 24 );



  Dancho_de_barra= Dancho_de_barra_total*(Dvida_que_le_queda/Dvida_total );
  rect(DXrect, DYrect, Dancho_de_barra, 24);
}
void dibujar_Ryu() {
  if (Reloj_Ryu>10) {

    Ryu=RyuGuardia;
  }
  image(Ryu, Posicio_Ryu, 200-Ryu.height);
}
void dibujar_Ken() {
  if (Reloj_Ken>10) {

    Ken=KenGuardia;
  }
  image(Ken, Posicio_Ken, 200-Ken.height);
}
void keyPressed() {
  if (key=='A'||key=='a') {
    Posicio_Ryu=Posicio_Ryu-5;
  }
  if (key=='D'||key=='d') {
    Posicio_Ryu=Posicio_Ryu+5;
  }
  if (key=='Q'||key=='q') {
    Ryu=RyuPuno;
    Reloj_Ryu=0;
    if (Posicio_Ryu+Ryu.width>=Posicio_Ken&&Posicio_Ryu+Ryu.width<=Posicio_Ken+Ken.width) {
      println("hit");
      Dvida_que_le_queda-=10;
      if(Dvida_que_le_queda<=0){
        Dvida_que_le_queda=0;
      }   
    }
  }

  if (key=='E'||key=='e') {
    Ryu=RyuPatada;
    Reloj_Ryu=0;
     if (Posicio_Ryu+Ryu.width>=Posicio_Ken&&Posicio_Ryu+Ryu.width<=Posicio_Ken+Ken.width) {
      println("hit");
      Dvida_que_le_queda-=15;
      if(Dvida_que_le_queda<=0){
        Dvida_que_le_queda=0;
      }
      }
  }
  if (key=='W'||key=='w') {
    Ryu=RyuBloqueo;
    Reloj_Ryu=0;
   
      
  }
  if (key=='J'||key=='j') {
    Posicio_Ken=Posicio_Ken-5;
  }
  if (key=='L'||key=='l') {
    Posicio_Ken=Posicio_Ken+5;
  }
  if (key=='U'||key=='u') {
    Ken=KenPuno;
    Reloj_Ken=0;
    if (Posicio_Ken>=Posicio_Ryu&&Posicio_Ken<=Posicio_Ryu+Ryu.width) {
      println("hitD");
      Ivida_que_le_queda-=15;
      if(Ivida_que_le_queda<=0){
        Ivida_que_le_queda=0;
      }
      }
  }
  if (key=='O'||key=='o') {
    Ken=KenPatada;
    Reloj_Ken=0;
    if (Posicio_Ken>=Posicio_Ryu&&Posicio_Ken<=Posicio_Ryu+Ryu.width) {
      println("hitD");
      Ivida_que_le_queda-=10;
      if(Ivida_que_le_queda<=0){
        Ivida_que_le_queda=0;
      }
      }
  }
  if (key=='i'||key=='I') {
    Ken=KenBloqueo;
    Reloj_Ken=0;
  }
}