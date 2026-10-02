/*
3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
(i) devolver la cantidad de libros almacenados en el estante
(ii) devolver si el estante está lleno
(iii) agregar un libro que se recibe al estante
(iv) dado un título, buscar y devolver el libro con ese título (ó null si no existe).

B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
busque e informe el autor del libro “Mujercitas”.

C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
almacenen como máximo N libros? ¿Cómo instanciaría el estante?

 */
package tema3;

public class PRACTICA_3_3 {

    public static void main(String[] args) {
        
        /*
        B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
        busque e informe el autor del libro “Mujercitas”.   */
        
        Estante e = new Estante();     // CREA el vector de 20 libros y setea su dimL en 0. No tiene libros y se deben ir agregando
        
        // cargar los datos en L1
        // L1.setTitulo("unTitulo")
        // e.agregarLibro(L1);
        
        // LA OTRA FORMA (MEJOR) ES ESTA:
        // La clase Libro tiene un constructor que permite pasar Titulo, editorial, autor e ISBN
        
        e.agregarLibro(new Libro("Titanic","una editorial","un Autor","325.111"));
        e.agregarLibro(new Libro("La Biblia","Catholic","Dios","787.932"));
        e.agregarLibro(new Libro("Mujercitas","Editame","Una Mujercita","777.777"));
        e.agregarLibro(new Libro("Cien años de soledad","no se amigo","Gabriel Garcia Marquez","931.162"));
        
        Libro mujercitas = e.buscarLibro("Mujercitas");   // buscarLibro RETORNA UN LIBRO !!! si lo encuentra
        if(mujercitas != null)
            System.out.println(mujercitas.getPrimerAutor());
        else    
            System.out.println("No se encontro el libro Mujercitas");
            
        /*
        C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
        almacenen como máximo N libros? ¿Cómo instanciaría el estante?          */
        
        /* 1- LE QUITO el valor 20 que inicializaba por defecto a la dimF en la clase Estante
           2- Ahora que la dimF no esta inicializada, la debo pasar como parámetro al CONSTRUCTOR
        
            public Estante(int dimF)
                this.setDimF(dimF);    ----> le queda el valor que paso por parametro
        
           3- Ahora se instanciará el objeto pasandole la dimF como parametro al CONSTRUCTOR
        
                Estante e = new Estante(50); 
        */
        
    }
    
}
