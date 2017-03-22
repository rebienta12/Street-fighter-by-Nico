PImage fons;
PImage RyuGuardia;
PImage RyuPuno;
PImage Ryu;
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
int Moviment_Ryu;
int Reloj_Ryu;



void setup() {
  size(600, 250);
  fons=loadImage("fons.gif");
  RyuGuardia=loadImage("RyuGuardia.png");
  RyuPuno=loadImage("RyuPuño.png");
  Ryu=RyuGuardia;
  IXrect=15;
  IYrect=5;
  IanchoBarraTotal=250;
  Ivida_total=250;
  Ivida_que_le_queda=100;
  Dvida_total=250;
  Dvida_que_le_queda=150;
  Dancho_de_barra_total=250;
  DYrect=5;
  DXrect=width/2;
  Dancho_de_barra=250;
  Moviment_Ryu=50;
  Reloj_Ryu=0;
}



void draw() {
  image(fons, 0, 0);
  dibujar_Ryu();
  dibuixaBarres();
  Reloj_Ryu++;
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
  if(Reloj_Ryu>10){
   Ryu=RyuGuardia; 
  }
  image(Ryu, Moviment_Ryu, 200-Ryu.height);
}
void keyPressed() {
  if (key=='A'||key=='a') {
    Moviment_Ryu=Moviment_Ryu-5;
  }
  if (key=='D'||key=='d') {
    Moviment_Ryu=Moviment_Ryu+5;
  }
  if (key=='Q'||key=='q') {
    Ryu=RyuPuno;
    Reloj_Ryu=0;
  }
}