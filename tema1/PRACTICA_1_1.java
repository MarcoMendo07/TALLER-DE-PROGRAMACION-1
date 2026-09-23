/*
1- Escriba un programa que lea las alturas de los 15 jugadores de un equipo de básquet y las almacene en un vector.  
Luego informe: 
-	la altura promedio
-	la cantidad de jugadores con altura por encima del promedio
*/
package tema1;

//Funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class PRACTICA_1_1 {
  
    public static void main(String[] args) {
        //Declaración y creación del vector
        final int DF = 15;    // final int seria una CONSTANTE
        
        double [] vector = new double[DF];  // DECLARACION de vector de reales (double)
        
        //Lectura de alturas, carga en el vector (ir calculando la suma de alturas)
        int i;
        double suma=0;      // le pone el valor 0 a las variables i y suma.
        
        for (i=0; i<DF;i++){       // i de 0 a 4 (5 iteraciones)
           System.out.println("Ingrese altura del jugador:");
           vector[i]= Lector.leerDouble();     // leer de teclado
           suma = suma + vector[i]; 
        }
        
        //Calculo del promedio de alturas, informar
        double prom = suma / DF;     // la suma de todas las alturas dividido la DF (15)
        
        
        // INFORMAR ALTURA PROMEDIO
        System.out.println("Promedio: "+ String.format("%.2f", prom));        // sino poner simplemtente PROM
        
        //Recorrido del vector calculando lo pedido (cant. alturas por encima del promedio)
         int cant=0;
         for (i=0; i<DF;i++){
              if (vector[i] > prom) cant++;   // recorre todo el vector contando las alturas mayores al prom. en la var. cant
         }
       
        // INFORMAR ALTURAS QUE SUPERAN EL PROMEDIO
        System.out.println("La cantidad de alturas que superan prom es: " + cant);
    }
    
}