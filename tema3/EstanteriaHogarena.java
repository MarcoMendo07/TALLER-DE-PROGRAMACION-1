/*
5- Representar una estantería hogareña.

Esta estantería tiene sólo dos estantes que almacenarán libros
(uno será el inferior y otro el superior).

(i) Genere la clase Estantería hogareña. Implemente un constructor que inicie la
estantería con sus dos estantes con capacidad máxima para 20 libros cada uno.
Nota: No vuelva a implementar la clase Estante. Reúse la clase definida anteriormente.

(ii) Provea métodos para:
- Agregar un libro a la estantería hogareña. El libro debe agregarse al estante inferior si
no está lleno, caso contrario al superior. HECHO

- Obtener la cantidad de libros almacenados en la estantería hogareña (considerar
ambos estantes).

- Dado un título, saber si ese libro está en la estantería hogareña (ya sea en el estante
inferior o en el superior).

(iii) Realice un programa que instancie una estantería hogareña, le agregue libros y
compruebe el funcionamiento de los métodos implementados.
 */

package tema3;

public class EstanteriaHogarena {
    
    private Estante estanteSuperior;
    private Estante estanteInferior;
    
    public EstanteriaHogarena(int unaDimF){
        this.estanteSuperior = new Estante(unaDimF);
        this.estanteInferior = new Estante(unaDimF);
    }

// - Agregar un libro a la estantería hogareña. El libro debe agregarse al estante inferior si
// no está lleno, caso contrario al superior.    
    
    public void agregarLibro(Libro libro){
        if(!this.estanteInferior.estaLleno())               // si NO ESTA LLENO ! (el estante inferior) --> agrego libro
            this.estanteInferior.agregarLibro(libro);
        else if(!this.estanteSuperior.estaLleno())      // no hace falta esta condicion pero esta bueno ponerlo ( ya lo evalua la clase estante)
            this.estanteSuperior.agregarLibro(libro);       // si el inf. esta lleno, agrego en el superior
    }
    
// - Obtener la cantidad de libros almacenados en la estantería hogareña (considerar
//  ambos estantes).    
    
    public int contarLibros(){      // usa el metodo getCantLibros de la clase Estante, que devuelve la dimL de cada uno. (tmb sirve getDimL).
        int cantLibros;   
        cantLibros = this.estanteInferior.getCantLibros() + this.estanteSuperior.getCantLibros();
        return cantLibros;
    }
    
// - Dado un título, saber si ese libro está en la estantería hogareña (ya sea en el estante
// inferior o en el superior).
    
    public boolean existeLibro(String unTitulo){
        if(this.estanteInferior.buscarLibro(unTitulo) != null)
            return true;
        else 
            return (this.estanteSuperior.buscarLibro(unTitulo) != null);   // devuelve true si es != null o false si es == null
    }
    // -----------------------------------------
    
    private Estante getEstanteSuperior() {
        return estanteSuperior;
    }

    private void setEstanteSuperior(Estante estanteSuperior) {
        this.estanteSuperior = estanteSuperior;
    }

    private Estante getEstanteInferior() {
        return estanteInferior;
    }

    private void setEstanteInferior(Estante estanteInferior) {
        this.estanteInferior = estanteInferior;
    }
    
}
