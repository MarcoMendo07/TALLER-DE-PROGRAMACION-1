/*1-A- Analice la jerarquía de figuras (carpeta tema4).
*/
package tema4.tema4ejercicio1;


public abstract class Figura {
    private String colorRelleno;
    private String colorLinea;
   
    public Figura(String unCR, String unCL){
        setColorRelleno(unCR);
        setColorLinea(unCL);
    }
    
    public String getColorRelleno(){
        return colorRelleno;       
    }
	
    public void setColorRelleno(String unColor){
        colorRelleno = unColor;       
    }
	
    public String getColorLinea(){
        return colorLinea;       
    }
	
    public void setColorLinea(String unColor){
        colorLinea = unColor;       
    }
    
    public abstract double calcularArea();
	
    public abstract double calcularPerimetro();

    public String toString(){
        String aux =// "Area: " + this.calcularArea() +           //Inciso D -  
                    //" Perimetro " + this.calcularPerimetro() +  //Añadir a la representación String 
                     " CR: "  + getColorRelleno() +               //el valor del perímetro. 
                     " CL: " + getColorLinea();             
             return aux;
       }
    
    public void despintar(){         // Inciso E-  
        colorLinea =   "negro";      // Añada el método despintar que establece los colores 
        colorRelleno = "blanco";     // de la figura a línea “negra” y relleno “blanco”.
    }
     
}
