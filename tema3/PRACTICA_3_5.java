/*
5- Representar una estantería hogareña.

Esta estantería tiene sólo dos estantes que almacenarán libros
(uno será el inferior y otro el superior).

(i) Genere la clase Estantería hogareña. Implemente un constructor que inicie la
estantería con sus dos estantes con capacidad máxima para 20 libros cada uno.
Nota: No vuelva a implementar la clase Estante. Reúse la clase definida anteriormente.

(ii) Provea métodos para:
- Agregar un libro a la estantería hogareña. El libro debe agregarse al estante inferior si
no está lleno, caso contrario al superior.
- Obtener la cantidad de libros almacenados en la estantería hogareña (considerar
ambos estantes).
- Dado un título, saber si ese libro está en la estantería hogareña (ya sea en el estante
inferior o en el superior).

(iii) Realice un programa que instancie una estantería hogareña, le agregue libros y
compruebe el funcionamiento de los métodos implementados.
 */

package tema3;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class PRACTICA_3_5 {
    
    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        System.out.println("Ingrese la capacidad maxima de libros que pueden tener los estantes (20)");
        int dimF = Lector.leerInt();
        System.out.println();
        
        int dimL = 0;
        
        EstanteriaHogarena e = new EstanteriaHogarena(dimF);
        
        // aca poner un while para agregar varios libros
        
        System.out.println("Ingrese un titulo de libro");
        String titulo = Lector.leerString();
        
        while(!titulo.equals("ZZZ") && (dimL < dimF*2)){         // mientras el titulo sea distinto de ZZZ y dimL sea menor a dimF
            String editorial = GeneradorAleatorio.generarString(5);
            String primerAutor = GeneradorAleatorio.generarString(10);
            String ISBN = GeneradorAleatorio.generarString(20);
        
            Libro l = new Libro(titulo,editorial,primerAutor,ISBN);
            e.agregarLibro(l);
            dimL++;
            
            System.out.println("Ingrese un titulo de libro");
            titulo = Lector.leerString();
        }
        
        int cantLibros = e.contarLibros();
        System.out.println();
        System.out.println("En total, la Estanteria Hogarena tiene "+cantLibros+" libros");
        System.out.println();
        
        //---------------------------------
        
        System.out.println("Ingrese el título de un libro para saber si se encuentra en la estanteria");
        titulo = Lector.leerString();
        System.out.println();
        if(e.existeLibro(titulo))
            System.out.println("El libro se encuentra en la estanteria");
        else
            System.out.println("El libro NO se encuentra en la estanteria");
        
        
    }
    
}
