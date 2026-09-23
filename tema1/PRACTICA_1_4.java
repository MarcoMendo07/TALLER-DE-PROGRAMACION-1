/* 4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso (1..4).
MATRIZ DE 8x4

Realice un programa que permita informar la cantidad de personas que concurrieron a
cada oficina de cada piso.

Para esto, simule la llegada de personas al edificio de la siguiente manera:

a cada persona se le pide el nro. de piso y nro. de oficina a la cual quiere concurrir.
La llegada de personas finaliza al indicar un nro. de piso 9. ----> esta bien del 0 al 7??? o tiene q ser exacto. debe terminar con 9

Al finalizar la llegada de personas, informe lo pedido. 

 */

package tema1;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class PRACTICA_1_4 {
    public static void main(String[] args) {
        
        int [][] edificio = new int[8][4];
        
        int i, j;
        int piso, oficina;
       
        
        //primero inicializar en 0 todo el edificio (lo hace autom. pero estaria mal no iniciarlo manualmente)
        
        for(i=0; i<8; i++)
            for(j=0; j<4; j++)
                edificio[i][j] = 0;
        
        //-----------------------------------------
            
        
        // PREGUNTA: que hago si quiero generar aleatoriamente los valores??
        // interpreto el 9 del enunciado como un 8? o que pasa si se genera el piso 8? (seria el noveno piso)
        
        
        System.out.println("--------NUEVO---------");
        System.out.println("Ingrese un numero de piso (del 0 al 7)");
        piso = Lector.leerInt();
        while(piso != 9){
            System.out.println("Ingrese un numero de oficina (del 0 al 3)");
            oficina = Lector.leerInt();
            edificio[piso][oficina] = edificio[piso][oficina] + 1;   // le sumo una persona
            System.out.println("--------NUEVO---------");
            System.out.println("Ingrese un numero de piso (del 0 al 7)");
            piso = Lector.leerInt();
        }
        
        // IMPRIMIR CONTENIDO
        
        System.out.println();
        System.out.println("Contenido del edificio:");
        System.out.println();
        
        for(i=0; i<8; i++){
            for(j=0; j<4; j++){
                 System.out.print(edificio[i][j] + " | ");
            }
            System.out.println();
        }    
        System.out.println("---------------");
                
    }
                       
}
