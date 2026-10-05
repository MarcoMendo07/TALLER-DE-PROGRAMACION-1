
package tema2;

public class Demo03QueImprime {

    public static void main(String[] args) {
        Persona p1; 
        Persona p2;
        p1 = new Persona();
        p1.setNombre("Pablo Sotile"); // pone datos a p1
        p1.setDNI(11200413);
        p1.setEdad(40);
        p2 = new Persona();     // pone datos a p2
        p2.setNombre("Julio Toledo");
        p2.setDNI(22433516);
        p2.setEdad(51);
        p1 = p2;        // le pasa la referencia a la dir. de memoria de p2 (Julio toledo)
        p1.setEdad( p1.getEdad() + 1 );     // edad Julio + 1 --> 52
        
        System.out.println(p1.getEdad());  // ----> imprime 52
        
        System.out.println(p2.toString());  // mi nombre es Julio Toledo...
        System.out.println(p1.toString());  // mi nombre es Julio Toledo...
        System.out.println( (p1 == p2) );   // TRUE ---> p1 = p2 le pasa la referencia a Julio Toledo, apuntan a la misma dir.
    }
    
    // IMPRIME: mi nombre es Julio Toledo..., mi nombre es Julio Toledo..., true
    
}
