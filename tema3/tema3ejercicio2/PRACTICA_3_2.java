/*
B- Modifique el programa PRACTICA_3_2(carpeta tema3) para instanciar los libros con su autor, 
considerando las modificaciones realizadas. 
Informe la representación String de los libros. 
A partir de un objeto libro ¿cómo obtengo el nombre de su autor?
 */
package tema3.tema3ejercicio2;

public class PRACTICA_3_2 {

    public static void main(String[] args) {
        Autor a = new Autor("Herbert Schildt", "informático, programador y músico", "USA");
        Libro libro1= new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 a, "978-0071809252", 21.72);
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               a, "978-1512108347"); 
        System.out.println("=== Representacion de libro1 ===");
        System.out.println(libro1.toString());
        System.out.println("=== Representacion de libro2 ===");
        System.out.println(libro2.toString());
        System.out.println("=== Nombre del autor de libro1 ===");
        System.out.println(libro1.getPrimerAutor().getNombre());   // A partir de un objeto libro ¿cómo obtengo el nombre de su autor?
    }
    
}
