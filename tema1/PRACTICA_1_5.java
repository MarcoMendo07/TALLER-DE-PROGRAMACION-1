/* 5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen (con
puntaje de 1 a 10) los siguientes aspectos:

(0) Atención al cliente (1) Calidad de la comida (2) Precio (3) Ambiente.

MATRIZ DE 5x4 que contiene puntajes del 1 al 10.

Escriba un programa que lea desde teclado las calificaciones de los cinco clientes para
cada uno de los aspectos y almacene la información en una estructura.

Luego imprima la calificación promedio obtenida por cada aspecto.
 */
package tema1;

import PaqueteLectura.Lector;

public class PRACTICA_1_5 {
    public static void main(String[] args) {
        int [][] puntajes = new int[5][4];
        
        int i,j;
        
        for(i=0; i<5; i++)
            for(j=0; j<4; j++){
                System.out.println("Ingrese el puntaje del aspecto "+j+" para el cliente "+(i+1));  // quedara cliente del 1 al 5
                puntajes[i][j]= Lector.leerInt();
            }
        
        // IMPRIMIR CONTENIDO
        
        System.out.println();
        System.out.println("Tabla de puntajes:");
        System.out.println();
        
        for(i=0; i<5; i++){
            for(j=0; j<4; j++){
                 System.out.print(puntajes[i][j] + " | ");
            }
            System.out.println();
        }    
        System.out.println("---------------");
        
        // IMPRIMIR CALIFICACION PROMEDIO POR CADA ASPECTO
        
        for(i=0; i<4; i++){
            int suma = 0;
            for(j=0; j<5; j++){
                suma += puntajes[j][i];   // la suma de toda una columna
            }
            System.out.println("El puntaje promedio del aspecto "+i+" es "+ (suma/5.0)); // IMPORTANTE CASTEAR A NUMEROS REALES (double) poniendo .0
        }
    }
    
}
