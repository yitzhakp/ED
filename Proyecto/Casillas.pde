Tablero go;
Tablero carcel, ircarcel;
Cartas PTR = null;
public class Cartas{

int num, tipo, quan;
String text1, text2;
Cartas next = this, prev = this;
  public Cartas(int n, int t, String t1, String t2,int q ){
    this.num = n;
    this.tipo = t;
    this.text1 = t1;
    this.text2 = t2;
   this.quan = q;
   }    

}

void addCard(Cartas c){
if(PTR == null){
PTR = c;
}else{
c.next = PTR;
c.prev = PTR.prev;
PTR.prev = c;
c.prev.next = c;
}

 }
public class Propiedad {

    String name;
    int venta;
    Jugador propietario;
    int casas;
    int alquilerCasas[] = new int[6];
    int precioCasa;
    int precioHotel;
    int hipoteca;
    Propiedad next = this;
    Propiedad prev = this;
    public Propiedad(String n, int v, int a, int c1,int c2,int c3,int c4,int h1, int hipo,int c, int h ) {
        this.name = n;
        this.venta = v;
        this.alquilerCasas[0] = a;
        this.casas = 0;
        this.propietario = null;
        this.alquilerCasas[1]= c1;
        this.alquilerCasas[2]= c2;
        this.alquilerCasas[3]= c3;
        this.alquilerCasas[4]= c4;
        this.alquilerCasas[5]= h1;
        this.hipoteca = hipo;
        this.precioCasa = c;
        this.precioHotel = h;
    }
    
        int alquiler(){
    return this.alquilerCasas[this.casas];
    }
}
public class Inicio{
  boolean propietario;
  
  public Inicio(){
  this.propietario = true;
  }
}
public class Cofre{}
public class Fortuna{}
public class Carcel{}
public class IrCarcel{}
public class Impuesto{
int pago;
public Impuesto(int p){
this.pago = p;
}
}
public class CasaEstudio{}
public class Tablero<T> {
    T data;
    int posx;
    int posy;
    Tablero next;
    Tablero prev;

    public Tablero(T d, int x, int y) {
        this.data = d;
        this.posx = x;
        this.posy = y;
        this.next = this;
        this.prev = this;
    }
}

void add(Tablero R) {
        if (go == null) {
            go = R;
        } else {
            R.next = go;
            R.prev = go.prev;
            go.prev = R;
            R.prev.next = R;
        }
    }
    
void load() {
       
          String [] lines = loadStrings("tablero.txt");
          int i = 0;
          
          
            while (i < lines.length) {
              String line = lines[i];
                String[] info = line.split(",");
                switch (Integer.valueOf(info[0])) {
                    case 1:
                        Propiedad Q = new Propiedad(info[1], Integer.valueOf(info[2]), Integer.valueOf(info[6]), Integer.valueOf(info[7]), Integer.valueOf(info[8]),
                        Integer.valueOf(info[9]), Integer.valueOf(info[10]), Integer.valueOf(info[11]), Integer.valueOf(info[12]), Integer.valueOf(info[13]), Integer.valueOf(info[13]));
                        Tablero<Propiedad> R = new Tablero(Q, Integer.valueOf(info[4]), Integer.valueOf(info[5]));
                        add(R);
                        break;

                    case 2:
                        Cofre C = new Cofre();
                        Tablero<Cofre> S = new Tablero(C, Integer.valueOf(info[1]), Integer.valueOf(info[2]));
                        add(S);
                        break;

                    case 3:
                        Fortuna F = new Fortuna();
                        Tablero<Fortuna> T = new Tablero(F, Integer.valueOf(info[1]), Integer.valueOf(info[2]));
                        add(T);
                        break;
                    case 4:
                        Inicio I = new Inicio();
                        Tablero<Inicio> U = new Tablero(I, Integer.valueOf(info[1]), Integer.valueOf(info[2]));
                        add(U);
                        break;
                    case 5:
                        Carcel J = new Carcel();
                        Tablero<Carcel> V = new Tablero(J, Integer.valueOf(info[1]), Integer.valueOf(info[2]));
                        carcel = V;
                        add(V);
                        break;
                    case 6:
                        IrCarcel G = new IrCarcel();
                        Tablero<IrCarcel> W = new Tablero(G, Integer.valueOf(info[1]), Integer.valueOf(info[2]));
                        ircarcel = W;
                        add(W);
                        break;
                    case 7:
                        Impuesto Im = new Impuesto(Integer.valueOf(info[1]));
                        Tablero<Impuesto> X = new Tablero(Im, Integer.valueOf(info[2]), Integer.valueOf(info[3]));
                        add(X);
                        break;
                    case 8:
                        CasaEstudio CE = new CasaEstudio();
                        Tablero<CasaEstudio> Z = new Tablero(CE, Integer.valueOf(info[1]), Integer.valueOf(info[2]));
                        add(Z);
                    default:
                }
                i++;
            }

    }
    
void loadCartas(){
        String [] lines = loadStrings("tarjetas.txt");
        int i = 0;
        while(i< lines.length){
        String line = lines[i];
        String[] info = line.split(";");
        Cartas temp = new Cartas(i,Integer.parseInt( info[2]), info[0], info[1],Integer.parseInt( info[3]));
        addCard(temp);
        i++;
        }
}

void display3(){
Cartas P = PTR;
  do{
              print(P.text1);
              print(P.text2);
              print(P.tipo);
              print("\n");
              P = P.next;
}while(P != PTR);
}

Cartas searchCard(int n){
int i = 1;
Cartas P = PTR;
  while(i != n){
    P = P.next;
    i++;
}
return P;

}
