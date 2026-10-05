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

 */

package tema3;
public class Circulo {
    
    private double radio;
    private String colorRelleno;
    private String colorLinea;
    
    public Circulo(double unRadio, String unColorRelleno, String unColorLinea){  // CONSTRUCTOR
        radio = unRadio;
        colorRelleno = unColorRelleno;
        colorLinea = unColorLinea;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
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
    
    // ----------------------------------------------------------
    
    public double calcularPerimetro(){
        double perimetro = (2* Math.PI * radio);       // 2 x PI x RADIO
        return perimetro;
    }
    
    public double calcularArea(){
        double area = Math.PI * (radio*radio);       // PI x RADIO al cuadrado
        return area;
    }
    
}
