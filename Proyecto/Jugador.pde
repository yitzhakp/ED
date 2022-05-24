public class Jugador {
    int number, b1, b5, b10, b20, b50, b100, b200, b500, turno, numP, carcel = 0;
    Tablero pos;
    Jugador next, prev;
    Propiedad propiedades;
    Propiedad menuP;
    public Jugador(int i, int n){
        this.turno = i;
        this.number = n;
        this.next = this;
        this.prev = this;
        this.pos = go;
        this.b1 = 10;
        this.b5 = 4;
        this.b10 = 3;
        this.b20 = 2;
        this.b50 = 2;
        this.b100 = 1;
        this.b200 = 1;
        this.b500 = 1;
    }
    
    void addPropiedad(Propiedad p){
    if(this.propiedades == null){
      p.next=p;
      p.prev = p;
      this.propiedades = p;
      this.menuP = p;
    }else{
      p.next = this.propiedades;
      p.prev = this.propiedades.prev;
      p.prev.next = p;
      this.propiedades.prev = p;
    }
    this.numP++;
    }
    
    void delPropiedad(){
    Propiedad p = this.menuP;
    if(p.next == p){
    this.propiedades = null;
    this.menuP = null;
    }else{
      p.prev.next = p.next;
      p.next.prev = p.prev;
      this.menuP = p.next;
    }
    p.propietario = null;
    this.devolver(p.hipoteca);
    this.numP--;
    }

    int getMoney(){
    return b1*1+b5*5+b10*10+b20*20+b50*50+b100*100+b200*200+b500*500;
    }
    
    
    void descontar(int valor){
    int b1=0, b5=0, b10=0, b20=0, b50=0, b100=0, b200=0, b500=0;
    
    b500 = valor/500;
    if(b500 > this.b500){b500 = this.b500;}
    valor = valor - b500*500;
    if(valor != 0){
      b200 = valor/200;
      if(b200 > this.b200){b200 = this.b200;}
      valor = valor - b200*200;
      if(valor != 0){
        b100 = valor/100;
        if(b100 > this.b100){b100 = this.b100;}
        valor = valor - b100*100;
        if(valor != 0){
          b50 = valor/50;
          if(b50 > this.b50){b50 = this.b50;}
          valor = valor - b50*50;
          if(valor != 0){
            b20 = valor/20;
            if(b20 > this.b20){b20 = this.b20;}
            valor = valor - b20*20;
            if(valor != 0){
              b10 = valor/10;
              if(b10 > this.b10){b10 = this.b10;}
              valor = valor - b10*10;
              if(valor != 0){
                b5 = valor/5;
                if(b5 > this.b5){b5 = this.b5;}
                valor = valor - b5*5;
                if(valor != 0){
                  b1 = valor/1;
                  if(b1 > this.b1){b1 = this.b1;}
                  valor = valor - b1*1;
                  
            }
            }
            }
          }
       }
      }
    }
        this.b1 = this.b1 - b1;
        this.b5 = this.b5 -b5;
        this.b10 = this.b10 - b10;
        this.b20 = this.b20 -b20;
        this.b50 = this.b50-b50;
      this.b100 = this.b100-b100;
      this.b200 = this.b200-b200;
      this.b500 = this.b500-b500;
      print(this.b1+" "+this.b5+" "+this.b10+" "+this.b20+" "+this.b50+" "+this.b100+" "+this.b200+" "+this.b500+"");
        int dev =0;
if(valor != 0){
  if(valor < 5 && this.b5 != 0){
    this.b5--;
    dev = 5;
  }
  else if(valor < 10 && this.b10 != 0){
  this.b10--;
    dev = 10;
}else if(valor < 20 && this.b20 != 0){
  this.b20--;
    dev = 20;
}else if(valor < 50 && this.b50 != 0){
  this.b50--;
    dev = 50;
}else if(valor < 100 && this.b100 != 0){
  this.b100--;
    dev = 100;
}else if(valor < 200 && this.b200 != 0){
  this.b200--;
    dev = 200;
}else if(valor < 500 && this.b500 != 0){
  this.b500--;
    dev = 500;
}
devolver(dev - valor);  
}    
}

void devolver(int valor){
    int b1=0, b5=0, b10=0, b20=0, b50=0, b100=0, b200=0, b500=0;
    
    b500 = valor/500;
    valor = valor - b500*500;
    if(valor != 0){
      b200 = valor/200;
      valor = valor - b200*200;
      if(valor != 0){
        b100 = valor/100;
        valor = valor - b100*100;
        if(valor != 0){
          b50 = valor/50;
          valor = valor - b50*50;
          if(valor != 0){
            b20 = valor/20;
            valor = valor - b20*20;
            if(valor != 0){
              b10 = valor/10;
              valor = valor - b10*10;
              if(valor != 0){
                b5 = valor/5;
                valor = valor - b5*5;
                if(valor != 0){
                  b1 = valor/1;
                  valor = valor - b1*1;
                  
            }
            }
            }
          }
       }
      }
    }
        this.b1 = this.b1 + b1;
        this.b5 = this.b5 + b5;
        this.b10 = this.b10 + b10;
        this.b20 = this.b20 + b20;
        this.b50 = this.b50 + b50;
      this.b100 = this.b100 +b100;
      this.b200 = this.b200+b200;
      this.b500 = this.b500+b500;

}

void move(int d){
    for(int i = 1; i <= 30; i++){
      this.pos = this.pos.next;
      if(this.pos == go){
          this.devolver(200);
      }    
    }
}
}
Jugador head = null;

void addPlayer(int d, int n){
Jugador P = new Jugador(d, n);
  if(head == null){
head = P;
}else if (P.turno > head.turno){
  print("val");
  P.prev = head.prev;
  P.next = head;
  head.prev.next = P;
  head.prev = P;
  head = P;
} else{
Jugador Q = head;
boolean sw = true;
do{
if(Q.next.turno < P.turno){
 P.next = Q.next;
 Q.next.prev = P;
 P.prev = Q;
 Q.next = P;
 sw = false;
 
}else{
Q = Q.next;
}
}while(Q != head & sw);

if(sw){
  print("hola");
 P.prev = head.prev;
 P.next = head;
 head.prev.next = P;
 head.prev = P;
}
}
}
void display(){
if(head == null){
print("la lista está vacía");
}else{
Jugador P = head;
  do{
     print(P.turno + "-> ");
     P = P.next;
}while(P != head);
print("\n");
}
}
void display2(){
if(go == null){
print("la lista está vacía");
}else{
Tablero P = go;
  do{
     print(P.data + "-> ");
     P = P.next;
}while(P != go);
print("\n");
}

}

