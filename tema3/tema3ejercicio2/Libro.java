/*
2- A- Queremos modelar libros y autores. 
Los libros conocen su título, el primer autor, editorial, año de edición, ISBN y precio. 
Del autor se conoce nombre, biografía y origen.

(i) Modifique la clase Libro (carpeta tema3) para considerar que el primer autor sea un objeto de la clase Autor.
(ii) Implemente la clase Autor, con constructores y métodos que permitan consultar/ modificar sus atributos 
y obtener una representación String (formada por nombre, biografía y origen).  GETTERS, SETTERS Y ToSTRING

(iii) Realice las modificaciones necesarias en la clase Libro (en constructores y métodos).

(iv) Incluya al toString de Libro el precio final, calculado adicionando el 21% de IVA al precio del libro. 
Para realizar este cálculo, implemente un método aparte.

B- Modifique el programa PRACTICA_3_2 (carpeta tema3) para instanciar los libros con su autor, considerando las modificaciones realizadas. 
Informe la representación String de los libros. 
A partir de un objeto libro ¿cómo obtengo el nombre de su autor?
 */
package tema3.tema3ejercicio2;

public class Libro {
   private String titulo;
   //private String primerAutor; 
   private Autor primerAutor;  //i. Modificación para considerar que el primer autor sea un objeto de la clase Autor.
   private String editorial;
   private int añoEdicion;
   private String ISBN; 
   private double precio; 
     
 // public Libro(  String unTitulo,  String unaEditorial, int unAñoEdicion, 
 //   String unPrimerAutor, String unISBN, double unPrecio){    
    public Libro(  String unTitulo,  String unaEditorial, int unAñoEdicion,
      Autor unPrimerAutor, String unISBN, double unPrecio){  // iii. Modificacion tipo de unPrimerAutor
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= unAñoEdicion;
         primerAutor = unPrimerAutor;
         ISBN =  unISBN;
         precio = unPrecio;
    }

//  public Libro(  String unTitulo,  String unaEditorial, 
//    String unPrimerAutor, String unISBN){    
    public Libro(  String unTitulo,  String unaEditorial, 
      Autor unPrimerAutor, String unISBN){                   // iii. Modificacion tipo de unPrimerAutor
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= 2015;
         primerAutor = unPrimerAutor;
         ISBN =  unISBN;
         precio = 100;
    }
    
    public Libro(){
   
    }
        
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }
  
 // public String getPrimerAutor(){
    public Autor getPrimerAutor(){                   // iii. Modificacion tipo de retorno
        return primerAutor;
    } 
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
   
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
   
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }
   
  //public void setPrimerAutor(String unPrimerAutor){
    public void setPrimerAutor(Autor unPrimerAutor){  // iii. Modificacion tipo de unPrimerAutor
         primerAutor=unPrimerAutor;
    } 
    public void setISBN(String unISBN){
         ISBN=unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio=unPrecio;
    }
   
    public double getPrecioFinal(){
        return precio * 1.21;
    }   
    
   @Override
    public String toString(){   // iii. Modificacion delego toString al autor  iv. añade precio final
        String aux;
      //aux= titulo + " por " + primerAutor + " - " + añoEdicion + " - " + " ISBN: " + ISBN;
        aux= titulo + " por " + primerAutor.toString() + " - " + añoEdicion + " - " + " ISBN: " + ISBN +
             "\nPrecio final: "+ this.getPrecioFinal();
       return ( aux);
    }
        
}
