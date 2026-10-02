/*
1- A- Definir dos clases independientes: una para representar triángulos (clase Triangulo)
y otra para círculos (clase Circulo).
- Los triángulos tendrán como atributos: el tamaño de sus 3 lados (double), el color de
relleno (String) y el color de línea (String).
- Los círculos tendrán como atributos: el radio (double), el color de relleno (String) y
el color de línea (String).
Provea en cada clase un constructor que reciba todos los datos necesarios para iniciar el
objeto y métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)


NOTA: El área de los triángulos se calcula con la fórmula Área = √s(s − a)(s − b)(s − c) ,
donde a, b y c son los lados y s = ( a+b+c )/2
. La función raíz cuadrada es Math.sqrt(#).
Para calcular el área y perímetro de los círculos use la constante Math.PI.


B- Realizar un programa que instancie un triángulo y un círculo e informe en consola el
perímetro y el área de cada uno. 
 */

package tema3;

public class PRACTICA_3_1 {
    public static void main(String[] args) {
        
        Triangulo t = new Triangulo(10.5, 10.2, 10.1, "Amarillo", "Verde");
        
        Circulo c = new Circulo(5.0, "Rojo", "Negro");
        
        System.out.println("TRIANGULO - Perimetro: "+t.calcularPerimetro()+" Area: "+t.calcularArea());
        System.out.println();
        System.out.println("CIRCULO - Perimetro: "+c.calcularPerimetro()+" Area: "+c.calcularArea());
        
    }
    
}
