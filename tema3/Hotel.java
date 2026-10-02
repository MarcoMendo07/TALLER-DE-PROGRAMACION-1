/*
4-A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está
ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).

(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.

(ii) Implemente los constructores. Los clientes inician a partir de nombre, DNI y edad.

El hotel inicia recibiendo la cantidad de habitaciones (N) y dos valores, que representan el
costo por noche de las habitaciones frente (índice impar) y contrafrente (índice par),
y debe iniciar sus N habitaciones desocupadas y con el costo correspondiente. HECHO

(iii) Implemente en las clases que corresponda todos los métodos necesarios para:
- Ingresar un cliente C en la habitación número X del hotel. Asuma que X está en rango
1..N y que la habitación está libre.
- Aumentar el precio de todas las habitaciones del hotel en un monto recibido.
- Obtener la representación String del hotel, siguiendo el formato:
{Habitación 1: costo, libre u ocupada, información del cliente si está ocupada}
…
{Habitación N: costo, libre u ocupada, información del cliente si está ocupada}

B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.

NOTA: Reúse la clase Persona. Para cada método solicitado piense a qué clase debe
delegar la responsabilidad de la operación.

 */
package tema3;

public class Hotel {
    
    private Habitacion[] hotel;  // v.i hotel (es un vector de habitaciones)
    private int dimF;
    private int dimL;
    
    public Hotel(int unaDimF, double costoImpares, double costoPares){    // CONSTRUCTOR DE HOTEL (inicia el hotel)
        this.setDimF(unaDimF);
        this.setDimL(0);
        this.hotel = new Habitacion[this.getDimF()];         // pongo N en dimF, 0 en dimL, creo el vector de dimF posiciones
        
        for(int i=0; i<dimF; i+= 2){                    
            this.hotel[i] = new Habitacion();
            this.hotel[i].setEstaOcupada(false);         // hotel en la posicion i es una HABITACION
            this.hotel[i].setCostoNoche(costoImpares);   // arranca en habitacion 1, no puede haber habitacion 0
            if((i+1)<dimF){
                this.hotel[i+1] = new Habitacion();
                this.hotel[i+1].setCostoNoche(costoPares);
            }
        }
        
    }

    /*(iii) Implemente en las clases que corresponda todos los métodos necesarios para:
      - Ingresar un cliente C en la habitación número X del hotel. Asuma que X está en rango
      1..N y que la habitación está libre.*/
    
    public void agregarCliente(int unNumHabitacion,Persona unCliente){     // void es cuando no retorna nada, sola hace una asignacion
        this.hotel[unNumHabitacion].setCliente(unCliente);                 // le pone el cliente que recibe a la habitacion
        this.hotel[unNumHabitacion].setEstaOcupada(true);                  // ahora la habitacion está ocupada
    }
    
     // - Aumentar el precio de todas las habitaciones del hotel en un monto recibido.     
     // tendria que definir el metodo aumentarPrecio y hacer h.aumentarPecio(monto)
     // setCosto getCosto + monto
    
    
    public void aumentarPrecio(double unMonto){
        for(int i=0; i<dimF; i+= 2){         //      += a 2 es lo mismo que i = i + 2.  Saltea 2 posiciones cada vez 0-2-4
            this.hotel[i].setCostoNoche(this.hotel[i].getCostoNoche() + unMonto);
            if((i+1)<dimF)
                this.hotel[i+1].setCostoNoche(this.hotel[i+1].getCostoNoche() + unMonto);  // busca el costo y le setea la suma con el nuevo monto
        }
            
    }
    
    /*- Obtener la representación String del hotel, siguiendo el formato:
        {Habitación 1: costo, libre u ocupada, información del cliente si está ocupada}
        …
        {Habitación N: costo, libre u ocupada, información del cliente si está ocupada}
        */
    
    
    public String toString(int i){            // dentro de las clases NO SE IMPRIME
        String aux;
        aux = this.hotel[i].toString();       // tomara el toString de la clase Habitacion
        return aux;
    }
    
    private Habitacion[] getHotel() {
        return hotel;
    }

    private void setHotel(Habitacion[] hotel) {
        this.hotel = hotel;
    }

    private int getDimF() {
        return dimF;
    }

    private void setDimF(int dimF) {
        this.dimF = dimF;
    }

    private int getDimL() {
        return dimL;
    }

    private void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    
    
}
