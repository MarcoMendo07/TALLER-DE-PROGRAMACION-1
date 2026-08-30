{Desafío…

5.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).  HECHO

Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2. (solo el 1 es igual)
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
próxima llamada recursiva?

Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.
Ejemplo: 255 --> 11111111      (128,64,32,16,8,4,2,1)      }


{tambien se puede resolver de otra forma:

En el procedimiento de obtener el binario
usar un while que adentro tenga

if(num MOD 2 = 0)then
	write('0')
else
	write('1');          }



program practica2_5;

const

dimF = 8;  // maximo 1 byte

type

vector = array[1..dimF] of integer;

procedure obtenerBinario(var v: vector; var dimL: integer; num: integer);  // devuelve el vector y la dimL, por eso NO puede ser funcion
var
aux: integer;
begin

	aux:= num MOD 2;   // digito par o impar  ---> Guarda 1 o 0 segun CORRESPONDA
	num:= num DIV 2;   // divido el numero por 2 para evaluar en el siguiente bit (cada uno vale el doble del anterior) (1 DIV 2 es 0, y ahi se corta el programa) (division entera)
	
	dimL:= dimL + 1;
	v[dimL]:= aux;     // guarda el valor en el vector
	
	if(num > 0)and(dimL < dimF)then    // es < dimF porque el valor se guarda antes
		obtenerBinario(v,dimL,num);
end;

procedure imprimirBinario(v: vector; dimL: integer);
begin
	if(dimL > 0)then begin
		write(v[dimL],' ');
		imprimirBinario(v, diml-1);
	end;
end;

var
num: integer;
v: vector;
dimL: integer;
BEGIN

num:= 1;

while(num <> 0)do begin
dimL:= 0;
writeln;
writeln;
writeln('Ingrese un Numero decimal para convertirlo a Binario: ');	
readln(num);

obtenerBinario(v,dimL,num);
imprimirBinario(v,dimL);	
end;	
END.

