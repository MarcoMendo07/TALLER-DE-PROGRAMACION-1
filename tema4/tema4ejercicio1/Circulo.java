/*
1-C. De igual manera, incluya la clase Círculo a la jerarquía de figuras.
 */
package tema4.tema4ejercicio1;

public class Circulo extends Figura{        //Inciso C
    
    private double radio;

    public Circulo(double radio, String unCR, String unCL) {
        super(unCR, unCL);   //Invoca al constructor de la superclase
        this.radio = radio;
    }
    
    // Metodos 
    
    //Getters y setters

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    //calcularPerimetro
    public double calcularPerimetro(){
        return 2*Math.PI*radio;
    }
   
    //calcularArea
    public double calcularArea(){
        return Math.PI*radio*radio;
    }

    //toString                            // Lo REDEFINO ...
    public String toString(){             // Asi ADEMAS concateno el radio   
        String aux = super.toString() +   
                    " Radio: " + radio;
        return aux;                      // ¿Por qué super y no this? 
    }  

}
