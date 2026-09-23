/* 2- Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice la
matriz con números aleatorios entre 0 y 30.

Luego realice las siguientes operaciones en recorridos independientes:
- Mostrar el contenido de la matriz en consola.

- Calcular e informar la suma de los elementos de la fila 1
- Generar un vector de 5 posiciones donde cada posición j contiene la suma de los
elementos de la columna j de la matriz. Luego, imprima el vector.
- Leer un valor entero e indicar si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario imprima “No
se encontró el elemento”.
NOTA: Dispone de un esqueleto para este programa en Ej02Matrices.java

 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class PRACTICA_1_2 {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
	GeneradorAleatorio.iniciar();
        
        //Paso 3. definir y crear la matriz de enteros de 5x5, iniciarla con nros. aleatorios 
        int[][] matriz = new int[5][5];
        
        int i, j;   // FILAS, COLUMNAS
                
        for(i=0; i<5; i++)        
            for(j=0; j<5; j++)
                matriz[i][j] = GeneradorAleatorio.generarInt(10);
        
        //Paso 4. mostrar el contenido de la matriz en consola
        
        System.out.println("Contenido de la matriz:");
        
        for(i=0; i<5; i++){        
            for(j=0; j<5; j++){
                System.out.print(matriz[i][j] + " | ");
            }
            System.out.println();
        }    
        
        System.out.println("-------------------");
        
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
    
        int suma = 0;
        int fila = 1;
        
        for(j=0; j<5; j++){
            suma = suma + matriz[fila][j];      // fila es simplemente el valor 1
        }
        
        System.out.println("Suma de los elementos de la fila 1: "+suma);  // la fila 1 es la SEGUNDA FILA
      
        System.out.println("-------------------");
        
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.

        int [] vector = new int[5];
        
        for(j=0; j<5; j++){                    // INVIERTO EL ORDEN, hago un for j que incluya a for i
            suma = 0;
            for(i=0; i<5; i++){                // RECORRIDO POR COLUMNA
                suma = suma + matriz[i][j];    // ahora analizo para cada COLUMNA, toda la columna, voy aumentando en las filas
            }
            vector[j] = vector[j] + suma;      // guarda la suma en esa posicion, y vuelve a empezar    
        }
        
        for(j=0; j<5; j++){ 
            System.out.println("Suma de los elementos de columna "+j+": "+vector[j]);
        }
        
        System.out.println("-------------------");
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. 
        //        En caso de encontrarse indique su ubicación (fila y columna)
        //        y en caso contrario imprima "No se encontró el elemento".
        
        System.out.println("Ingrese un valor entero");
        int valor = Lector.leerInt();
        
        boolean encontro = false;
        int filaEncontrada = -1;
        int columnaEncontrada = -1;
        i = 0;  
        
        // Mientras no me pase del límite de filas Y no haya encontrado el valor
        while (i < 5 && !encontro) {
            j = 0;
            
            // Mientras no me pase del límite de columnas Y no haya encontrado el valor
            while (j < 5 && !encontro) {
                
                if (valor == matriz[i][j]) {
                    encontro = true;
                    filaEncontrada = i;
                    columnaEncontrada = j;
                }
               
                j++; // Incrementamos la columna manualmente
            }
            
            i++; // Incrementamos la fila manualmente
        }    
            
        if (encontro){
            System.out.println("El elemento se encontró en la fila " + filaEncontrada + ", columna " + columnaEncontrada);
        } else {
            System.out.println("No se encontró el elemento");
        }
      
    }
}
