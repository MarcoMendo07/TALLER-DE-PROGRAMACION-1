//Ejemplos uso for vistos en clase.

package tema1;

public class Demo07For {

    public static void main(String[] args) {
         System.out.println("Primer for");
         int i;
         for(i=1; i<=10; i++){
              System.out.println("I vale: " + i);
         }
         System.out.println("Segundo for");
         for(i=10; i>0; i= i-1){                // es lo MISMO poner i--
              System.out.println("I vale: " + i);
         }

    }
    
}
