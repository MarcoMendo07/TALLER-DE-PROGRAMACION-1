/*
1-G. Realizar un programa que instancie un triángulo y un círculo.
Muestre en consola la representación String de cada uno. 
Pruebe el funcionamiento de los métodos despintar y  esGrande. 
 */
package tema4.tema4ejercicio1;


public class Ejercicio1main {
    
    public static void main(String[] args) {  //Inciso E-
        
        Triangulo t = new Triangulo(10,10,10,"amarillo", "violeta");
        Circulo   c = new Circulo (3, "verde", "azul");
        System.out.println("Triangulo: " + t.toString());  //ver ejecucion
        System.out.println("Circulo: "   + c.toString());  

        t.despintar();                                     //ver ejecucion
        c.despintar();
        
        System.out.println("Figuras despintadas ... "); 
        System.out.println("Triangulo: " + t.toString()); 
        System.out.println("Circulo: "   + c.toString());        
    }
    
    
    
}
