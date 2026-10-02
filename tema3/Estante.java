
// CLASE ESTANTE. Para el Ejercicio 3.

/*3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
(i) devolver la cantidad de libros almacenados en el estante
(ii) devolver si el estante está lleno
(iii) agregar un libro que se recibe al estante
(iv) dado un título, buscar y devolver el libro con ese título (ó null si no existe).
*/


package tema3;


public class Estante {
    private Libro[] libros;  // variable de instancia libros (vector de objetos Libro) PODRIA llamarse estante
    private int dimF = 20;
    private int dimL;        // no le pongo valor porque la desconozco
            
    // ------------------------------------------------------------------------------
    
    // Implemente un constructor que permita iniciar el estante sin libros.
    public Estante(){
        this.libros = new Libro[this.getDimF()];  // le llegara el valor 20, que esta puesto arriba
        this.setDimL(0);
    }

    public int getCantLibros(){   // (i) ES MAS LEGIBLE para el usuario que getDimL
        return this.getDimL();
    }
    
    public boolean estaLleno(){
        return (this.getDimL() == this.getDimF());   // (ii) Devuelve true si dimL es == a dimF
    }
    
    public void agregarLibro(Libro libro){          // (iii) agrega un libro que se recibe como parametro
        if(!this.estaLleno()){                      // solo agrega el libro nuevo si la dimL es menor a dimF
            this.libros[this.getDimL()] = libro;    // le agrego un libro
            this.setDimL(this.getDimL() + 1);
            //this.dimL++
        }
    }
    
    public Libro buscarLibro(String unTitulo){       // (iv) dado un título, buscar y devolver el libro con ese título (ó null si no existe).
        boolean encontrado = false;
        int pos = 0;
        while ((pos < this.getDimL()) && (!encontrado)){
            if(this.libros[pos].getTitulo().equals(unTitulo))
                encontrado = true;
            else
                pos++; 
        }
        if(encontrado)
            return this.libros[pos];               // this.libros ES el VECTOR DE LIBROS que hay en el estante.
        else
            return null;
    }
    
    
    // ------------------------------------------------------------------------------
    // TODOS ESTOS DEBEN SER PRIVADOS
    
    
    private Libro[] getLibros() {
        return libros;
    }

    private void setLibros(Libro[] libros) {
        this.libros = libros;
    }

    private int getDimF() {
        return dimF;
    }

    private void setDimF(int dimF) {
        this.dimF = dimF;
    }

    private int getDimL() {
        return dimL;
    }

    private void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    
}
