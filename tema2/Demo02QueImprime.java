
package tema2;

public class Demo02QueImprime {
    public static void main(String[] args) {
        String saludo1=new String("hola");
        String saludo2=new String("hola");
        System.out.println(saludo1 == saludo2);  // compara si apuntan a la misma direccion de mem. (false, son distintas referencias)
        System.out.println(saludo1 != saludo2);  // true, son distintas dir. de memoria
        System.out.println(saludo1.equals(saludo2)); // true, compara el estado interno. (ambos tienen "hola")

        // IMPRIME: false, true, true. (en distintas lineas).
        
    } 
}
