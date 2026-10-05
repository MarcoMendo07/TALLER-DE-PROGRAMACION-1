/*
4-A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está
ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).

(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.
(ii) Implemente los constructores. Los clientes inician a partir de nombre, DNI y edad.

El hotel inicia recibiendo la cantidad de habitaciones (N) (dimF de HOTEL) y dos valores, que representan el
costo por noche de las habitaciones frente (índice impar) y contrafrente (índice par),
y debe iniciar sus N habitaciones desocupadas y con el costo correspondiente. ----> inicializar el vector (HOTEL) en desocup.

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

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class PRACTICA_3_4 {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        System.out.println("Ingrese la cantidad de Habitaciones del Hotel (N) ");
        int dimF = Lector.leerInt();
        
        System.out.println("Ingrese el costo por noche de las habitaciones impares ");
        double costoImpares = Lector.leerDouble();
        
        System.out.println("Ingrese el costo por noche de las habitaciones pares ");
        double costoPares = Lector.leerDouble();
        
        Hotel h = new Hotel(dimF,costoImpares,costoPares);  // hasta aca td bien, debo crear en la CLASE, el vector hotel desocupado
        
    /* (iii) Implemente en las clases que corresponda todos los métodos necesarios para:
        - Ingresar un cliente C en la habitación número X del hotel. Asuma que X está en rango
        1..N y que la habitación está libre.    */  
        
        System.out.println("Ingrese un numero de habitacion para un cliente (entre 1  y "+dimF+")");
        int numHabitacion = Lector.leerInt();
        
        while(numHabitacion != -1){    // la lectura corta al ingresar numHabitacion -1
            String nombre = GeneradorAleatorio.generarString(10);
            int dni = 20000000 + GeneradorAleatorio.generarInt(19999999);
            int edad = 20 + GeneradorAleatorio.generarInt(60);
        
            Persona c = new Persona(nombre,dni,edad);
            h.agregarCliente(numHabitacion-1, c);      // numHabitacion - 1
            
            System.out.println("Ingrese un numero de habitacion para un cliente (entre 1  y "+dimF+")");
            numHabitacion = Lector.leerInt();
        }
        
        /*B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
        muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.*/
        
        for(int i=0; i<dimF; i++){
            System.out.println("Habitacion "+(i+1)+": "+h.toString(i));
        }
        
        System.out.println();
        System.out.println("Ingrese un monto (double) de incremento para el precio de todas las habitaciones");
        double monto = Lector.leerDouble();
        System.out.println();
        
        h.aumentarPrecio(monto);
        
        for(int i=0; i<dimF; i++){
            System.out.println("Habitacion "+(i+1)+": "+h.toString(i));
        }
        
        /*- Obtener la representación String del hotel, siguiendo el formato:
        {Habitación 1: costo, libre u ocupada, información del cliente si está ocupada}
        …
        {Habitación N: costo, libre u ocupada, información del cliente si está ocupada}
        
        Agregue un método public String toString() a la clase Habitacion que
        evalúa si está ocupada o no y devuelve el texto armado. Así, en la clase Hotel, el método de impresión se
        resume a llamar a this.hotel[i].toString(), logrando un código mucho más limpio.*/
        
    }
    
}
