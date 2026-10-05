/*
4- Se realizará un casting para un programa de TV. El casting durará 5 días y en cada día
se entrevistarán a 8 personas en distinto turno.

a) Simular el proceso de inscripción de personas al casting.
A cada persona se le pide sus datos (nombre, DNI y edad) y se la debe asignar en un día y turno de la siguiente manera:

las personas primero completan el primer día en turnos
sucesivos, luego el segundo día y así siguiendo. La inscripción finaliza al llegar una
persona con nombre “ZZZ” o al cubrirse los 40 cupos de casting.

SIMPLEMENTE INSCRIBIRLOS CONSECUTIVAMENTE EN LA MATRIZ POR DIAS

Una vez finalizada la inscripción:
b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.

Piense: ¿Es necesario recorrer toda la estructura en el inciso b?
 */

package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class PRACTICA_2_4 {

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
        
        // a) SIMPLEMENTE INSCRIBIRLOS CONSECUTIVAMENTE EN LA MATRIZ POR DIAS
        
        int cantInscriptos = 0;   // 40 es el maximo de cupos
        int dia = 0,turno = 0;
        
        System.out.println("Ingrese nombre: ");
        String nombre = Lector.leerString();
        
        while((!nombre.equals("ZZZ")) && (cantInscriptos < 40)){ // MIENTRAS sea distinto de ZZZ y haya menos de 40 inscriptos
            
            int dni = 20000000 + GeneradorAleatorio.generarInt(19999999);
            int edad = 20 + GeneradorAleatorio.generarInt(60);
            
            if(turno < CANT_TURNOS){
                casting[dia][turno++] = new Persona(nombre,dni,edad);    // al dia 0 turno 0 le asigno la persona, y luego avanza al siguiente
                vector[dia]++;    // sumo 1 a la dimL del dia actual
                cantInscriptos++;
            }
            else{    
                dia++;
                turno = 0;
            }
            
            System.out.println("Ingrese nombre: ");
            nombre = Lector.leerString();
        }
        
        // b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
        
        System.out.println();
        
        for(i=0; i<CANT_DIAS; i++){   // i de 0 a 4
            j = 0;
            System.out.println("--------------------------------");
            while(j < vector[i]){
                System.out.println("Dia "+(i+1)+" turno "+(j+1)+" asignado a: "+casting[i][j].getNombre());
                j++;
            }
        }
        
        // NO HACE FALTA RECORRER TODA LA ESTRUCTURA. Manejamos una dimL para cada dia de la matriz.
        
    }
    
}
