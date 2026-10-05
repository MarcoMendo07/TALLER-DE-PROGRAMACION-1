/*
1- A- Definir dos clases independientes: una para representar triángulos (clase Triangulo)
y otra para círculos (clase Circulo).

- Los triángulos tendrán como atributos: el tamaño de sus 3 lados (double), el color de
relleno (String) y el color de línea (String).

- Los círculos tendrán como atributos: el radio (double), el color de relleno (String) y
el color de línea (String).

Provea en cada clase un constructor que reciba todos los datos necesarios para iniciar el
objeto y métodos para:

- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)  ---> deben ser publicos, lo necesita el main
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)


NOTA: El área de los triángulos se calcula con la fórmula Área = √s(s − a)(s − b)(s − c) ,
donde a, b y c son los lados y s = ( a+b+c )/2
. La función raíz cuadrada es Math.sqrt(#).
Para calcular el área y perímetro de los círculos use la constante Math.PI.

 */

package tema3;
public class Triangulo {
    
    private double ladoA;
    private double ladoB;
    private double ladoC;
    private String colorRelleno;
    private String colorLinea;

    public Triangulo(double unLadoA,double unLadoB,double unLadoC,String unColorRelleno,String unColorLinea){  // CONSTRUCTOR   
        ladoA = unLadoA;
        ladoB = unLadoB;
        ladoC = unLadoC;
        colorRelleno = unColorRelleno;
        colorLinea = unColorLinea;
    }
    
    // GETTERS Y SETTERS
    
    public double getLadoA() {
        return ladoA;
    }

    public void setLadoA(double ladoA) {
        this.ladoA = ladoA;     // a la variable de instancia de este objeto, le pone el parámetro ladoA.
    }

    public double getLadoB() {
        return ladoB;
    }

    public void setLadoB(double ladoB) {
        this.ladoB = ladoB;
    }

    public double getLadoC() {
        return ladoC;
    }

    public void setLadoC(double ladoC) {
        this.ladoC = ladoC;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    // --------------------------------------------------
    
    public double calcularPerimetro(){    
        return ladoA+ladoB+ladoC;        // devuelve la suma de los 3 lados. NO USO THIS porque no esta como parametro.
    }
    
    public double calcularArea(){
        double s = (this.calcularPerimetro() / 2);             // (a + b + c) / 2
        return Math.sqrt(s*(s-ladoA)*(s-ladoB)*(s-ladoC));     // √s(s − a)(s − b)(s − c) 
    }
    
}
