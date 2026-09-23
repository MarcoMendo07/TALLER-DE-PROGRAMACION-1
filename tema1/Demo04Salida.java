/*
 Muestra Hola Mundo en consola.

 */

package tema1;

/**
 *
 * @author vsanz
 */
public class Demo04Salida {

   public static void main(String[] args) {
        System.out.print("Hola Mundo! "); 
        System.out.println("Hola Mundo! "); 
        System.out.println(1234);
        System.out.println(false);         // valores booleanos y numeros se pueden imprimir sin ""
        
        System.out.println("a");           // para un solo char puedo usar ' o " --> Es lo mismo
        
        int año=2026;
        System.out.println ("Hola Mundo " + año + "!");

   }
}


