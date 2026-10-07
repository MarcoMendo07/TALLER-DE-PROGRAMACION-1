/*
4- El Servicio Meteorológico necesita un sistema que permita reportar las temperaturas
alcanzadas en una fecha y partido determinados. El sistema conoce nombre del partido,
provincia donde se ubica, la fecha de las mediciones, y guarda para cada localidad (1..N)
del partido y cada franja horaria (1: mañana, 2: tarde, 3: noche) la temperatura alcanzada.

Además, nos piden dos tipos de sistema que difieren en la manera de reportar:

el Sistema de Reporte Local informará para cada localidad del partido la temperatura
promedio alcanzada, mientras que el Sistema de Reporte Global informará para cada
franja horaria la temperatura promedio alcanzada en el partido. Se detalla más adelante.


Implemente las clases, constructores y métodos que considere necesarios para:
a) Crear el sistema de reporte recibiendo partido, provincia, fecha y la cantidad de
localidades (N) del partido. Inicie cada temperatura en un valor muy alto.

b) Registrar la temperatura de una localidad y franja horaria recibidos por parámetro.
Nota: La localidad está en rango 1..N y la franja horaria está en rango 1..3.

c) Obtener la temperatura de una localidad y franja horaria recibidos por parámetro.
Nota: La localidad está en rango 1..N y la franja horaria está en rango 1..3.

d) Devolver un String que concatene el código de localidad y franja horaria en que se
registró la mayor temperatura. Nota: Suponga que ya se registraron las
temperaturas de todas las localidades/franjas horarias.

e) Devolver un reporte String con el nombre del partido, provincia, fecha y las
temperaturas promedio según el tipo de sistema:
- el Sistema de Reporte Local debe calcular la temperatura promedio de cada localidad
(el promedio de la localidad X se calcula con sus datos en todas las franjas horarias).
Ej: “La Plata – Buenos Aires – 24/12/2025
Localidad 1: 39,8 ºC;
Localidad 2: 37,7 ºC;
… ”
- el Sistema de Reporte Global debe calcular la temperatura promedio de cada franja
horaria (el promedio de la franja X se calcula con sus datos en todas las localidades).
 Ej: “La Plata – Buenos Aires – 24/12/2025
 Franja horaria 1: 31,3 ºC;
Franja horaria 2: 38,7 ºC;
Franja horaria 3: 34,7 ºC; ”

Nota: Suponga que ya se registraron las temperaturas de todas las localidades/
franjas horarias. Use el carácter \n para concatenar un salto de línea.

f) Realice un programa que cree un Sistema de Reporte Local, para el partido de La Plata
– Bs As – 24/12/2025 y 5 localidades. Registre todas las temperaturas (para todas las
localidades/franjas horarias). Luego cree un Sistema de Reporte Global, para el
partido de Berisso – Bs As - 24/12/2025 y 4 localidades. Registre todas las
temperaturas (para todas las localidades/franjas horarias). Para cada sistema creado,
imprima la información retornada por los métodos d y e.
NOTA: Preste atención de no violar el encapsulamiento al resolver el ejercicio
 */
package tema4;

public abstract class Sistema {
    private String nombrePartido;
    private String provincia;
    private String fecha;
    private double [][] temperaturas;
    private int dimF;
    
    /*Implemente las clases, constructores y métodos que considere necesarios para:
a) Crear el sistema de reporte recibiendo partido, provincia, fecha y la cantidad de
localidades (N) del partido. Inicie cada temperatura en un valor muy alto.*/
    
    public Sistema(String unNombrePartido, String unaProvincia, String unaFecha, int unaDimF){
        this.setNombrePartido(unNombrePartido);
        this.setProvincia(unaProvincia);
        this.setFecha(unaFecha);
        
        this.setDimF(unaDimF);
        this.temperaturas = new double[unaDimF][3];     // matriz de double Nx3
        
        for(int i=0; i<unaDimF; i++)
            for(int j=0; j<3; j++)
                this.temperaturas[i][j] = 99.9;
    }

    /*b) Registrar la temperatura de una localidad y franja horaria recibidos por parámetro.
Nota: La localidad está en rango 1..N y la franja horaria está en rango 1..3.*/
    
    public void registrarTemperatura(int unaLocalidad, int unaFranjaHoraria, double unaTemperatura){
        this.temperaturas[unaLocalidad][unaFranjaHoraria] = unaTemperatura;
    }
    
    /*c) Obtener la temperatura de una localidad y franja horaria recibidos por parámetro.
Nota: La localidad está en rango 1..N y la franja horaria está en rango 1..3.*/
    
    public double getTemperatura(int unaLocalidad, int unaFranjaHoraria){
        return this.temperaturas[unaLocalidad][unaFranjaHoraria];        
    }
    
    /*d) Devolver un String que concatene el código de localidad y franja horaria en que se
registró la mayor temperatura. Nota: Suponga que ya se registraron las
temperaturas de todas las localidades/franjas horarias.*/
    
    public String stringTemperaturaMax(){
        int franjaHorariaMax = -1;
        int localidadMax = -1;
        double temperaturaMax = -99.0;
        
        for(int i=0; i<this.getDimF(); i++)
            for(int j=0; j<3; j++){
                if(this.temperaturas[i][j] > temperaturaMax){
                    temperaturaMax = this.temperaturas[i][j];
                    localidadMax = i;
                    franjaHorariaMax = j;
                }
            }
        return "TEMPERATURA MAX: Codigo de localidad: "+(localidadMax+1)+", Codigo de franja horaria: "+(franjaHorariaMax+1);
    }    
    
    
    public abstract String devolverReporte();   // e)
    
    
// --------------------------------------    

    public int getDimF() {
        return dimF;
    }

    private void setDimF(int dimF) {
        this.dimF = dimF;
    }
    
    public String getNombrePartido() {
        return nombrePartido;
    }

    private void setNombrePartido(String nombrePartido) {
        this.nombrePartido = nombrePartido;
    }

    public String getProvincia() {
        return provincia;
    }

    private void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getFecha() {
        return fecha;
    }

    private void setFecha(String fecha) {
        this.fecha = fecha;
    }

 /*
    public double[][] getTemperaturas() {
        return temperaturas;
    }

    public void setTemperaturas(double[][] temperaturas) {
        this.temperaturas = temperaturas;
    }
    
   */
}
