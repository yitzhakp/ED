PImage dado1, dado2;
int d1 = 6 , d2 = 6;
int sw = 20;
void turnos (){
mode = 2;
}

void lanzar(){
      d1 = int(random(6)+1);
      d2 = int(random(6)+1);
      sw++;
}
