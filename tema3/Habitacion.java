/*
  4-A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está
ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).

(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.

(ii) Implemente los constructores. Los clientes inician a partir de nombre, DNI y edad.

El hotel inicia recibiendo la cantidad de habitaciones (N) (dimF de HOTEL) y dos valores, que representan el
costo por noche de las habitaciones frente (índice impar) y contrafrente (índice par),
y debe iniciar sus N habitaciones desocupadas y con el costo correspondiente.
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

public class Habitacion {
    
    private double costoNoche;
    private boolean estaOcupada;
    private Persona cliente;
    
    public Habitacion(){          // no dice nada sobre el constructor de habitacion, SOLO importa la clase, que tenga sus v.i
           
    }
    
    public double getCostoNoche() {
        return costoNoche;
    }

    public void setCostoNoche(double costoNoche) {
        this.costoNoche = costoNoche;
    }

    public boolean getEstaOcupada() {
        return estaOcupada;
    }

    public void setEstaOcupada(boolean estaOcupada) {
        this.estaOcupada = estaOcupada;
    }

    public Persona getCliente() {
        return cliente;
    }

    public void setCliente(Persona cliente) {
        this.cliente = cliente;
    }

     /*- Obtener la representación String del hotel, siguiendo el formato:
        {Habitación 1: costo, libre u ocupada, información del cliente si está ocupada}
        …
        {Habitación N: costo, libre u ocupada, información del cliente si está ocupada}
        */
    
    /*Te sugiero agregarle un método public String toString() a tu clase Habitacion que
      evalúe si está ocupada o no y devuelva el texto armado. Así, en tu clase Hotel, el método de impresión se
      resumiría a llamar a this.hotel[i].toString(), logrando un código mucho más limpio.*/

    @Override
    public String toString(){
        String aux;
        if(this.getEstaOcupada())
            aux = this.getCostoNoche()+", ocupada, Nombre: "+this.getCliente().getNombre()+" DNI: "+this.getCliente().getDNI()+
                                                                                           " Edad: "+this.getCliente().getEdad();
        else
            aux = this.getCostoNoche()+", libre";
                    
        return aux;
    }
    
}
