/*
(ii) Implemente la clase Autor, con constructores y métodos que permitan consultar/ modificar sus atributos
y obtener una representación String (formada por nombre, biografía y origen).
 */

package tema3.tema3ejercicio2;

public class Autor {
    private String nombre;
    private String biografia;
    private String origen; 

    public Autor(String nombre, String biografia, String origen) {
        this.nombre = nombre;
        this.biografia = biografia;
        this.origen = origen;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }
    
    public String toString() {
        return "Nombre: " + nombre + " (biografia: " + biografia + "; origen: " + origen + ")";
    }
    
        
}
