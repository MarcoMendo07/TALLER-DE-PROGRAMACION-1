/*

3- Se realizará un casting para un musical. El casting durará 5 días y en cada día se
entrevistarán a 8 personas en distinto turno.  ---->  MATRIZ de 5x8  (filas,columnas)


a) Simular el proceso de inscripción de personas al casting. 

A cada persona se le pide sus datos (nombre, DNI, edad) , el día (1..5) y turno (1..8) en que se quiere
presentar al casting. La persona debe ser inscripta en ese día y turno si está
disponible.   ----> si no es null

En caso contrario, sólo informe la situación. La inscripción finaliza al
llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos de casting.

Una vez finalizada la inscripción:
b) Informar para cada día y turno: si está asignado o no y el nombre de la persona
a entrevistar en ese caso de estar asignado.

NOTA: utilizar la clase Persona. Pensar en la estructura de datos. Para comparar Strings
use el método equals.

 */  
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class PRACTICA_2_3 {
    
    public static void main(String[] args) {
        final int CANT_DIAS= 5, CANT_TURNOS= 8;
        
        // 5 días y 8 turnos por día (MATRIZ)
        Persona[][] casting = new Persona[CANT_DIAS][CANT_TURNOS];
        
        // Inicio los turnos en disponible (inicio todo en null)
        for (int dia=0; dia < CANT_DIAS; dia++){
           for (int turno=0; turno < CANT_TURNOS; turno++){
              casting[dia][turno]= null;  
           }
        }
        
        int cantidadInscritos = 0;
        
        System.out.println("Ingrese nombre: ");
        String nombre = Lector.leerString();
       
        
        // a) Inscripción 
        while ((!nombre.equals("ZZZ")) && (cantidadInscritos < 40)) {   // !nombre.equals("ZZZ") es mientras sea distinto. y no se llenen los cupos
                //System.out.println("Ingrese DNI: ");
                //int DNI  = Lector.leerInt();
                int DNI  = 20000000 + GeneradorAleatorio.generarInt(19999999);  // entre 20M y 40M - 1
                //System.out.println("Ingrese edad: ");
                //int edad = Lector.leerInt();
                int edad = 20 + GeneradorAleatorio.generarInt(50);     // entre 20 y 69
                
                System.out.println("Ingrese dia (1..5): ");   // si aclara el rango es suficiente, no hace falta controlar esto
                int dia  =  Lector.leerInt();  
                while (dia < 1 || dia > CANT_DIAS){           // || es OR
                     System.out.println("Día inválido. Ingrese dia (1..5): ");
                     dia  =  Lector.leerInt();
                } 
                
                System.out.println("Ingrese turno (1..8): "); // si aclara el rango es suficiente, no hace falta controlar esto
                int turno = Lector.leerInt();
                while  (turno < 1 || turno > CANT_TURNOS){    // || es OR
                     System.out.println("Turno inválido. Ingrese turno (1..8): ");
                     turno = Lector.leerInt();
                } 

                if (casting[dia - 1][turno - 1] == null) {    // SE LE RESTA 1 PORQUE DEBE GUARDARSE de 0 a 4
                        // El turno está disponible 
                        Persona p = new Persona(nombre, DNI, edad); 
                        casting[dia - 1][turno - 1] = p; 
                        
                        // casting[dia - 1][turno - 1] = new Persona(nombre, DNI, edad); ----> SE PUEDE HACER ESTO
                        
                        cantidadInscritos++; 
                        System.out.println("Persona inscripta correctamente."); 
                 } else { 
                       // El turno ya está ocupado 
                       System.out.println("El día y turno seleccionado ya está ocupado."); 
                 }
                
                 System.out.println("-------------------");
                 System.out.println("Ingrese nombre: ");
                 nombre = Lector.leerString();
        }
        
        
        // b) Informar el estado de cada día y turno 
        System.out.println("===== CASTING ====="); 
        for (int dia = 0; dia < CANT_DIAS; dia++) { 
            System.out.println("-----------------------------------------------");
            System.out.println("Día " + (dia + 1) + ":"); 
            for (int turno = 0; turno < CANT_TURNOS; turno++) { 
                if (casting[dia][turno] == null) { 
                    System.out.println("Turno " + (turno + 1) + ": DISPONIBLE"); } 
                else { 
                    System.out.println("Turno " + (turno + 1) + ": ASIGNADO a " + casting[dia][turno].getNombre() ); 
                } 
            } 
        }
    }
    
}