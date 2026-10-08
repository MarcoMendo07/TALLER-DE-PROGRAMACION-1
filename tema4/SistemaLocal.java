/*
el Sistema de Reporte Local informará para cada localidad del partido la temperatura
promedio alcanzada

, mientras que el Sistema de Reporte Global informará para cada
franja horaria la temperatura promedio alcanzada en el partido. Se detalla más adelante.

e) Devolver un reporte String con el nombre del partido, provincia, fecha y las
temperaturas promedio según el tipo de sistema:

- el Sistema de Reporte Local debe calcular la temperatura promedio de cada localidad
(el promedio de la localidad X se calcula con sus datos en todas las franjas horarias).
Ej: “La Plata – Buenos Aires – 24/12/2025
Localidad 1: 39,8 ºC;
Localidad 2: 37,7 ºC;
… ” --------------------------> calcular promedio de toda LA FILA

- el Sistema de Reporte Global debe calcular la temperatura promedio de cada franja
horaria (el promedio de la franja X se calcula con sus datos en todas las localidades).
 Ej: “La Plata – Buenos Aires – 24/12/2025
 Franja horaria 1: 31,3 ºC;
Franja horaria 2: 38,7 ºC;
Franja horaria 3: 34,7 ºC; ”  --------------------------> calcular promedio de toda la COLUMNA

Nota: Suponga que ya se registraron las temperaturas de todas las localidades/
franjas horarias. Use el carácter \n para concatenar un salto de línea.

 */
package tema4;

public class SistemaLocal extends Sistema {
    
    public SistemaLocal(String unNombre, String unaProvincia, String unaFecha, int unaDimF){
        super(unNombre,unaProvincia,unaFecha,unaDimF);
    }    
    
    public String devolverReporte(){    // calcular prom para todas las FILAS (localidades)
        String aux;
        String aux2 = "";
        
        aux = this.getNombrePartido()+" - "+this.getProvincia()+" - "+this.getFecha()+"\n";  // ¿¿ESTA LINEA podria ser un metodo de la clase Sistema?
                                                                                             // ya que se repite en ambos Sistemas
        for(int i=0; i<this.getDimF(); i++){
            double suma = 0;
            for(int j=0; j<3; j++){
                suma = suma + this.getTemperatura(i, j);  // es como usar la matriz
            }
            aux2 = aux2 + "Localidad "+(i+1)+": "+suma/3.0+" ºC \n";
        }
        return aux + aux2;
    }
    
}
