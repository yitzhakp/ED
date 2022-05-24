int n =2, i =0,aux = 0, mode = 1, c, car = 0;
boolean wait1=false, wait2= true, del = false;
boolean sw2= true, sw3 = true, compra = false, sw4 = true, pago = false, moveM = false, impuesto = false, finall = false, change = false, gojail = false, bienestar = false, cree = false;
Propiedad actual, menuP;
Impuesto im;
Jugador current;
Cartas cart;
void setup(){
  size(displayWidth, displayHeight);
  background(0);
  textSize(36);
  text("Ingrese el número de jugadores:   "+ n, 500, 410);
  image(loadImage("U.png"), 1200, 300);
  image(loadImage("D.png"), 1200, 400);
  image(loadImage("continuar1.png"), 700, 550);
  frameRate(10);
  load();
  loadCartas();
}

void draw(){
  if(mode == 1){
  background(0);
  textSize(36);
  text("Ingrese el número de jugadores:   "+ n, 500, 410);
  image(loadImage("U.png"), 1200, 300);
  image(loadImage("D.png"), 1200, 400);
  image(loadImage("continuar.png"), 700, 550);
  }
  if(mode == 2){
      background(0);
      text("Definamos los turnos: Jugador #"+(i+1), 600, 100);
      dado1 = loadImage(d1+".png");
      dado2 = loadImage(d2+".png");
      image(dado1, 650, 300);
      image(dado2, 950, 300);
      image(loadImage("lanzar.png"), 550, 600);
      image(loadImage("continuar.png"), 900, 600);
      if(sw != 20){
          sw = (sw + 1) % 21;
          lanzar();
      }else if (aux != 0){
        addPlayer(d1+d2, i+1);
        sw2 = false;
        if(i == n-1){
          mode = 3;
          display();
          current = head;
         }
         aux = 0;
      }   
  }else if(mode == 3 && sw2 && sw4){
      dra();
      if(compra || pago || impuesto || gojail || bienestar || cree){
      sw4 = false;
      }
      if(sw != 20){
          sw = (sw + 1) % 21;
          lanzar();
      }else if (aux != 0){
        current.move(d1+d2);
        aux = 0;
        sw3 = false;
        if(current.pos.data instanceof Propiedad ){
          actual = (Propiedad)current.pos.data;
          if(actual.propietario == null){  
            compra = true;
            }else if(actual.propietario != current){
            pago = true;
            }
        }else if(current.pos.data instanceof Impuesto){
           im = (Impuesto)current.pos.data;
           impuesto = true;
        }else if(current.pos == ircarcel){
          gojail = true;
        }else if(current.pos.data instanceof Cofre){
          bienestar = true;
        }else if(current.pos.data instanceof Fortuna){
          cree = true;
        } 
      } 
  }else if (mode == 4){
  background(0);
  text(current.number+" es el ganador", 100,100);
  }
  
  if(mode == 3 && sw2 && !change && !wait1){
      dra();
  if(current.propiedades == null){
        textAlign(CENTER);
        text("Todavía no tiene propiedades", 1415, 440);
        textAlign(LEFT);
        
      }else{
        textAlign(CENTER);
        text(current.menuP.name, 1415,440);
        textAlign(LEFT);
        image(loadImage("L.png"), 1200, 400);
        image(loadImage("R.png"), 1600, 400);
        image(loadImage("vender.png"), 1350, 450);
      }
      
      if(compra){
      sw4 = false;
            text("¿Deseas comprar la propiedad? ", 1000, 850);
            image(loadImage("si.png"), 1150, 900);
            image(loadImage("no.png"), 1300, 900);
      }else if(pago){
            sw4 = false;
            if(wait2){
            carta("bienestar","Caíste en la propiedad de otro jugador", "Pagarás "+actual.alquiler(), -1);
            }
      }else if(impuesto){
            sw4 = false;
            if(wait2){
            carta("bienestar","Caíste en una casilla de impuesto","Pagarás "+im.pago, -1 );
            }
      }else if(gojail){
            sw4 = false;
            if(wait2){
              carta("bienestar","Irás a la carcel", "", 0);
            }
            if(cree){
            cree = false;
            }
      }else if(bienestar){
        sw4 = false;
            if(wait2){
              c = (int)random(25) +1;
              cart = searchCard(c);
              carta("bienestar",cart.text1, cart.text2, cart.tipo);
              
            }
      
      }else if(cree){
        sw4 = false;
           if(wait2){
               c =(int)random(27)+1;
              cart = searchCard(c);
              carta("cree",cart.text1, cart.text2, cart.tipo);
            }
      
      }
  }
}


void dra(){
      background(0);
      image(loadImage("tablero.png"), 0, 0);
      text("Jugador #"+current.number,1330, 50);
      stroke(0);
      strokeWeight(3);
      fill(123);
      rect(current.pos.posx,current.pos.posy,20,20);
      noStroke();
      fill(255);
      dado1 = loadImage(d1+".png");
      dado2 = loadImage(d2+".png");
      image(dado1, 1200, 100);
      image(dado2, 1450, 100);
      image(loadImage("lanzar1.png"), 1230, 300);
      image(loadImage("continuar1.png"), 1450,300);
      image(loadImage("Billetes.png"), 1000, 600); 
      text("x"+current.b1, 1015, 580);
      text("x"+current.b5, 1115, 580);
      text("x"+current.b10, 1215, 580);
      text("x"+current.b20, 1315, 580);
      text("x"+current.b50, 1415, 580);
      text("x"+current.b100, 1515, 580);
      text("x"+current.b200, 1615, 580);
      text("x"+current.b500, 1715, 580);
      text("Total: "+current.getMoney(), 1700, 860);
}

void carta (String tipo, String text1, String text2, int sw){
   if(sw == -1 || sw == 0 || (sw == 4  && cart.quan ==1)){
   image(loadImage(tipo+".png"), 225, 350);
    fill(0); 
    textSize(12);
    text(text1, 300, 425);
    text(text2, 300, 475);
    textSize(36);
    fill(255);
     if(sw ==-1){
       wait2 = false;
       wait1 = true;
           image(loadImage("si.png"), 340, 500);
            car = 1;
   }else{
               
              car = 2;
              wait1 = true;
              image(loadImage("si.png"), 340, 500);
              wait2= false;
              if(sw==4){
              current.carcel = current.carcel +2;
              }      
  }
}else if(sw== 4 && cart.quan == -1){
  gojail = true;
}

}

void pagos(int amount, boolean sw ){
  if(amount>current.getMoney()){
      if(current.numP >1){
        carta("bienestar", "No tienes suficiente dinero","Vende unas de tus propiedades", 0);
       }
      else{
        carta("bienestar","No tienes suficiente dinero, perdiste", "",0);
        
        if(sw){
          actual.propietario.devolver(current.getMoney()); 
        }
        current.descontar(current.getMoney());
        
        change = true;
        wait2 = false;
        sw4= true;
        pago = false;
        del = true;
        }
 }else{
      current.descontar(amount);
      if(sw){
          actual.propietario.devolver(amount);  
      }
      wait2 = false;
      sw4= true;
      pago = false;
    }
}

void mousePressed(){
if(mode == 1){ 
  if(mouseX >1200 && mouseX <1297){
    if(mouseY >300 && mouseY < 392 && n<4){
       n++;
    }else if(mouseY > 400&& mouseY < 492 && n>2){
       n--;
    }
  }else if(mouseX > 700 && mouseX < 1095 && mouseY>550 && mouseY<650){
    turnos();
  }
}else if(mode == 2){
    if(mouseX > 550 && mouseX <550+273  && mouseY>600 && mouseY<700 && sw2){
        lanzar();
        aux =1;
    }
}else if(mode == 3){
    if(mouseX > 1200 && mouseX < 1250 && mouseY >400 && mouseY < 453 &&current.propiedades != null){
    current.menuP = current.menuP.prev;
    }else if(mouseX > 1600 && mouseX < 1650 && mouseY >400 && mouseY < 453 &&current.propiedades != null){
    current.menuP = current.menuP.next;
    }else if(mouseX > 1350 && mouseX < 1500 && mouseY >450 && mouseY < 500 &&current.propiedades != null){
    current.delPropiedad();
    }
    
    if(wait1){
      if(mouseX > 340 && mouseX < 390 && mouseY >500 && mouseY < 550){
      if(gojail){
        current.pos = carcel;
        current.carcel =current.carcel-2;
        if(current.carcel >=0){
        carta("bienestar", "Haz gastado una carta para salir libre","No se te saltará el turno", 0);
        
        }else{
        carta("bienestar", "Estás en una clase","No podrás jugar en la siguiente ronda", 0);
        }
        gojail = false;
        car = 0;
      }else if(pago){
      pagos(actual.alquiler(), true);
      wait1 = false;
      }else if (impuesto){
      pagos(im.pago, false);
      wait1 = false;
      }else if(car == 1){
      pagos(cart.quan, false);
      wait1 = false;
      }else if(car ==2){
      current.devolver(cart.quan);
      wait1 = false;
      }else{
      wait1 = false;
      }
        
      
      
      }
      
    }else if(compra){
       if(mouseX > 1150 && mouseX < 1200 && mouseY>900 && mouseY<950){
       
         if(actual.venta <= current.getMoney()){
           current.addPropiedad(actual);
           current.descontar(actual.venta);
           actual.propietario = current;
           compra = false;
           sw4 = true;
         }else{
           carta("bienestar", "No tienes suficiente dinero","Vende unas de tus propiedades", 0);
         }
         
       }else if(mouseX > 1300 && mouseX < 1370 && mouseY>900 && mouseY<950){
       compra = false;
       sw4 = true;
       }
    }else if(mouseX > 1230 && mouseX < 1367 && mouseY>300 && mouseY<350 && sw3){
        lanzar();
        aux =1;
    }else if(mouseX > 1450 && mouseX < 1450+198 && mouseY>300 && mouseY<350 && !sw3 ){
        sw3 = true;
        pago = false;
      if(del){
        current = current.prev;
        current.next = current.next.next;
        current.next.prev = current;
        if(current.next == current){
            finall = true;
          }
      }
      
      if(finall){
      mode = 4;
      }else{
      change = false;
      }

      do{
        current = current.next;
        if(current.carcel < 0){
        current.carcel++;
        }
      }while(current.carcel ==-1);  
      bienestar = false;
      pago = false;
      impuesto = false;
      cree = false;
      sw4 = true;
      car = 0;
      wait2 = true;
  }  
}

if(mouseX > 900 && mouseX < 1295 && mouseY>600 && mouseY<700&& !sw2){
      i++;
      sw2 = true;

}
}
