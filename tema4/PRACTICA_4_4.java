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
localidades/franjas horarias). 

Luego cree un Sistema de Reporte Global, para el
partido de Berisso – Bs As - 24/12/2025 y 4 localidades. 

Registre todas las
temperaturas (para todas las localidades/franjas horarias). Para cada sistema creado,
imprima la información retornada por los métodos d y e.
NOTA: Preste atención de no violar el encapsulamiento al resolver el ejercicio
 */
package tema4;

import PaqueteLectura.Lector;

public class PRACTICA_4_4 {
    public static void main(String[] args) {
       
       SistemaLocal sl = new SistemaLocal("La Plata","Bs As","24/12/2025",3);  // 5
       
       for(int i=0; i<sl.getDimF(); i++){   // <= a dimF para simular correctamente la carga de datos??? como es un for no molesta
           for(int j=0; j<3; j++){           // Luego, en el registrarTemperatura, registrarlo en la pos. [unaLocalidad-1][unaFranja-1]
            System.out.println("Ingrese la Temperatura para la localidad "+(i+1)+" de La Plata - "
                    + "Franja Horaria: "+(j+1));
            double unaTemperatura = Lector.leerDouble();
            sl.registrarTemperatura(i, j, unaTemperatura);
           }
       } 
       
       //-----------------------------------------------
       System.out.println();
        
       SistemaGlobal sg = new SistemaGlobal("Berisso","Bs As","24/12/2025",2);  // 4
       
       for(int i=0; i<sg.getDimF(); i++){  // <= a dimF para simular correctamente la carga de datos
           for(int j=0; j<3; j++){          // Luego, en el registrarTemperatura, registrarlo en la pos. [unaLocalidad-1][unaFranja-1]
            System.out.println("Ingrese la Temperatura para la localidad "+(i+1)+" de Berisso - "
                    + "Franja Horaria: "+(j+1));
            double unaTemperatura = Lector.leerDouble();
            sg.registrarTemperatura(i, j, unaTemperatura);
           }
       }
       
       System.out.println();
       System.out.println(sl.stringTemperaturaMax());
       System.out.println();
       System.out.println(sl.devolverReporte());
       
       System.out.println();
       System.out.println(sg.stringTemperaturaMax());
       System.out.println();
       System.out.println(sg.devolverReporte());
       
      
    }
    
}
