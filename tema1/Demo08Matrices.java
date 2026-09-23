
/**
 * Ejemplo de operaciones típicas con matrices: inicializar, recorrer, sumar, imprimir
 */

package tema1;
import PaqueteLectura.GeneradorAleatorio;

public class Demo08Matrices {

public static void main(String[] args) {
    int[][] tabla = new int[3][4];   // matriz de 3x4 = 12 elementos en total
    int i, j;    // FILAS, COLUMNAS
    
    /* Inicializamos la matriz */
    
    for (i=0;i<3;i++)
        for(j=0;j<4;j++)
            tabla[i][j] = GeneradorAleatorio.generarInt(10);  // genera un int entre 0 y 9
    
    /* Imprimimos la matriz de manera más clara **/
    System.out.println("Elementos de la matriz tabla: ");
    for (i = 0; i < 3; i++) {
      for (j = 0; j < 4; j++) {
        System.out.print(tabla[i][j] + " | ");
      }
      System.out.println();   // para saltar a la linea siguiente
    }
    
    /* Imprimimos una columna completa. j son las columnas */
    
    int columna = 0;
    System.out.println();
    System.out.print("Elementos de la columna "+ columna +": ");
    for(i=0;i<3;i++)
           System.out.print(tabla[i][columna]+ " ");
    System.out.println();

    /* Sumamos los elementos de la fila 2 */
    
    int fila = 2, suma = 0;
    for(j=0;j<4;j++)
        suma = suma + tabla[fila][j]; 
    System.out.print("La suma de la fila "+ fila +" es: " + suma);    // la fila 2 es la TERCER FILA (arranca en 0)
    
    System.out.println();
    
    // IMPORTANTE: para recorrer toda una fila, debemos mantener la misma fila de la matriz, e ir aumentando las COLUMNAS, y viceversa 
    // IMPORTANTE: la primer columna y primer fila de la matriz es tabla[0][0] ---> arranca en 0
 }

}

