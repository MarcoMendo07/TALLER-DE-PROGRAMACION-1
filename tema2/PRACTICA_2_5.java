/*
5- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre,
DNI, edad) y el día en que se quiere presentar al casting.

La persona debe ser
inscripta en ese día, en el siguiente turno disponible. En caso de no existir un turno
en ese día, informe la situación. La inscripción finaliza al llegar una persona con
nombre “ZZZ” o al cubrirse los 40 cupos de casting.

Una vez finalizada la inscripción:
b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre
de la persona a entrevistar en cada turno asignado.

NOTA: Use una estructura auxiliar que para cada día mantenga la cantidad de personas
inscriptas, así sabrá cuál es el siguiente turno disponible de cada día. (el vector de dimL)
 */

package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class PRACTICA_2_5 {

    public static void main(String[] args) {
                final int CANT_DIAS = 5, CANT_TURNOS = 8;  // cada persona en un turno distinto
        
        Persona[][] casting = new Persona[CANT_DIAS][CANT_TURNOS]; // Matriz de 5x8
        
        int[] vector = new int[5];   // vector que guarda las dimL para cada DIA
        
        int i,j;
        
        // INICIALIZAR MATRIZ en null
        
        for(i=0; i<CANT_DIAS; i++)
            for(j=0; j<CANT_TURNOS; j++){
                casting[i][j] = null;
            } 
    
        // INICIALIZAR VECTOR DE dimL en 0
        
        for(i=0; i<CANT_DIAS; i++)
            vector[i] = 0;
        
        // -------------------------------------
        
        /* a) ...el día en que se quiere presentar al casting. La persona debe ser
              inscripta en ese día, en el siguiente turno disponible. En caso de no existir un turno
              en ese día, informe la situación. La inscripción finaliza al llegar una persona con
              nombre “ZZZ” o al cubrirse los 40 cupos de casting.   */
        
        int cantInscriptos = 0;   // 40 es el maximo de cupos
        int dia = 0;
        
        System.out.println("Ingrese nombre: ");
        String nombre = Lector.leerString();
        
        while((!nombre.equals("ZZZ")) && (cantInscriptos < 40)){ // MIENTRAS sea distinto de ZZZ y haya menos de 40 inscriptos
            
            int dni = 20000000 + GeneradorAleatorio.generarInt(19999999);
            int edad = 20 + GeneradorAleatorio.generarInt(60);
            
            System.out.println("Ingrese dia en que se quiere presentar (entre 1 y 5)");
            int diaElegido = Lector.leerInt() - 1;     // ESPECTACULAR HACER ESTO ASI
            
            if(vector[diaElegido] < CANT_TURNOS){  // osea de 0 a 7
                casting[diaElegido][vector[diaElegido]] = new Persona(nombre,dni,edad);  // en el turno, le paso el turno numero: el que 
                                                                                         // figure en el vector. Si es el 1ro, sera el 0. Me ahorro var. turno                                                                                     
                vector[diaElegido]++; // sumo 1 a la dimL del dia elegido
                cantInscriptos++;
            }
            else{    
                System.out.println("No quedan turnos disponibles para el dia "+(diaElegido + 1)+", pruebe con otro dia");
            }
            
            System.out.println("Ingrese nombre: ");
            nombre = Lector.leerString();
        }
        
        // b)  Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre
        //     de la persona a entrevistar en cada turno asignado.
        
        System.out.println();
        
        for(i=0; i<CANT_DIAS; i++){   // i de 0 a 4
            System.out.println("--------------------------------");
            System.out.println("Dia "+(i+1)+", total de inscriptos: "+vector[i]);
            System.out.println("--------------------------------");
            
            for(j=0; j < vector[i]; j++){  // j de 0 hasta la dimL de cada dia
                System.out.println("Turno "+(j+1)+" asignado a: "+casting[i][j].getNombre());   
            }
        }
        
        // NO HACE FALTA RECORRER TODA LA ESTRUCTURA. Manejamos una dimL para cada dia de la matriz.
        
    }
    
}
