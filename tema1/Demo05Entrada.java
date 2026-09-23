
package tema1;

/**
 *
 * @author vsanz
 */
import PaqueteLectura.Lector; 			// Importar funcionalidad para lectura IMPORTANTE, cuando se lean cosas de teclado
public class Demo05Entrada 
{
    public static void main(String[] args) {
        System.out.println("Ingrese nombre");
        String nombre = Lector.leerString();  	                //Lee y devuelve el string ingresado antes del enter (SON FUNCIONES)
        System.out.println("Ingrese si trabaja (true/false)");  
        boolean trabaja = Lector.leerBoolean();	                //Lee y devuelve el boolean ingresado antes del enter
        System.out.println("Ingrese edad");
        int edad = Lector.leerInt();	                                 //Lee y devuelve el int ingresado antes del enter
        System.out.println("Ingrese sueldo");
        double sueldo = Lector.leerDouble();	              //Lee y devuelve el double ingresado antes del enter
        
        System.out.println("N:" + nombre + " T:" + trabaja + " E:" + edad + " S:" + sueldo );
    }
}
