/*
3- Un teatro realizó durante los 7 días de la semana 4 funciones diarias.

Escriba un programa que cargue en una estructura la cantidad de espectadores que
concurrieron a cada día/función. UNA MATRIZ QUE GUARDE CANT DE ESPECTADORES

Una vez cargada, realice recorridos independientes para:
- Dado un día (int) leído de teclado, informar la cantidad de espectadores que
concurrieron a cada función en ese día.

- Dada una función (int) leída de teclado, informar la cantidad de espectadores que
concurrieron en cada día a esa función. 

- Informar en qué día y función hubo más espectadores.  HECHO
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class PRACTICA_1_3 {
    public static void main(String[] args) {
       
        int [][] teatro = new int[7][4];
        
        // cargar la matriz teatro con valores aleatorios
        GeneradorAleatorio.iniciar();
        int i, j;
               
        for(i=0; i<7 ; i++){
            for(j=0; j<4 ; j++){
                teatro[i][j] = GeneradorAleatorio.generarInt(10);  // 0 a 9
            }
        }

        // IMPRIMIR MATRIZ
        //-----------------------------------------------------
        System.out.println("Contenido de la matriz:");
        
        for(i=0; i<7; i++){        
            for(j=0; j<4; j++){
                System.out.print(teatro[i][j] + " | ");
            }
            System.out.println();
        }    
        System.out.println("---------------");
        //-----------------------------------------------------
        
        /*Una vez cargada, realice recorridos independientes para:
          - Dado un día (int) leído de teclado, informar la cantidad de espectadores que
          concurrieron a cada función en ese día.*/
        
        // debe recorrer para el dia, las 4 funciones y devolver el total de espect.
        
        System.out.println("Ingrese un numero de dia de la semana (0 a 6)");
        int dia = Lector.leerInt();
        int total = 0;
        
        for(j=0; j<4; j++)
            total = total + teatro[dia][j];
        
        System.out.println("En el dia "+dia+" asistieron "+total+" personas al teatro");
        
        
        /*- Dada una función (int) leída de teclado, informar la cantidad de espectadores que
            concurrieron en cada día a esa función. RECORRER UNA COLUMNA*/
        
        System.out.println();
        System.out.println("Ingrese un numero de funcion (0 a 3)");
        int funcion = Lector.leerInt();
        total = 0;      // si o si inicializarla de nuevo en 0
        
        for(i=0; i<7; i++)
            total = total + teatro[i][funcion];
            
        System.out.println("En la semana, asistieron "+total+" personas a la funcion "+funcion);
            
        // - Informar en qué día y función hubo más espectadores. CALCULAR MAXIMO
        
        int max = -1;
        int funMax = 0;
        int diaMax = 0;
        
        for(i=0; i<7; i++)
            for(j=0; j<4; j++){
                if(teatro[i][j] > max){
                    max = teatro[i][j];
                    diaMax = i;
                    funMax = j;
                } 
            }
                
        System.out.println();
        System.out.println("Maximos espectadores registrados en el dia: "+diaMax+" ,funcion: "+funMax);
        // El NUMERO MAX. es el 9, si se repite no lo cuenta. se queda con la primera aparicion
        
    }
    
}
