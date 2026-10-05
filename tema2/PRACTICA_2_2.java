/*
2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:

 - Informe la cantidad de personas mayores de 65 años.
 - Muestre la representación de la persona con menor DNI.

 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class PRACTICA_2_2 {
    public static void main(String[] args) {
        final int dimF = 15;
        int dimL = 0, edadMax = 100, dniMax = 100000;
        
        Persona[] personas = new Persona[dimF];   // vector que contiene objetos Persona. llamado personas. de 15 posiciones (dimF). 
        
        
        GeneradorAleatorio.iniciar();   // reinicia la semilla
        int edad = GeneradorAleatorio.generarInt(edadMax); // entre 0 y 99
       
        while((dimL < dimF) && (edad != 0)) {    // poner todos los parentesis
            Persona p = new Persona();
            p.setEdad(edad);
            p.setNombre(GeneradorAleatorio.generarString(10));
            p.setDNI(GeneradorAleatorio.generarInt(dniMax)); // entre 0 y 99999
            
            personas[dimL++] = p;  // le pasa la persona que acabo de generar, y luego suma en la dimL. (el ++ va despues)
            edad = GeneradorAleatorio.generarInt(edadMax);  // genero otra edad para una nueva persona
        }
        
        for(int i=0; i<dimL; i++)
            System.out.println(personas[i]);   // Imprime directamente toda la representacion. "Mi nombre es Marco..."
            
        // - Informe la cantidad de personas mayores de 65 años.
        
        
        if(dimL > 0){    // si el vector no esta vacio
        
            Persona menorPersona = personas[0];    // lo uso para comparar despues
            int cant = 0;
        
            for(int i=0; i<dimL; i++){
                if((personas[i].getEdad() > 65))     // equals es para string
                    cant++;
                if((personas[i].getDNI() < menorPersona.getDNI() ))
                    menorPersona = personas[i];
                  
            }
        
        System.out.println();    
        System.out.println("La cant. de personas mayores a 65 años es: "+cant);
            
        // - Muestre la representación de la persona con menor DNI.
       
        System.out.println("Persona con menor DNI: "+menorPersona);  // imprime "mi nombre es...". es como el toString
        
        }
    }
    
}
