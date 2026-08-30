{a) Copie el siguiente programa.

program NumAleatorio;
var ale: integer;
begin
 randomize;
 ale := random (100);
 writeln ('El número aleatorio generado es: ', ale);
 readln;
end.

b) Compile y ejecute el programa descargado

c) Responda ¿Qué hace el programa? --> en cuaderno 

Modifique el programa incorporando:

d) Un módulo que imprima 20 números aleatorios.

e) Un módulo que imprima N números aleatorios en el
rango (A,B), donde N, A y B son números enteros que se
leen por teclado y se reciben como parámetros.

f) Un módulo que imprima números aleatorios en el
rango (A,B) hasta que se genere un valor igual a F, el cual
no debe imprimirse. F, A y B son números enteros que se
leen por teclado y se reciben como parámetros.}

program practica0_1;

procedure incD;
var
i: integer;
ale: integer;
begin
for i:= 1 to 20 do begin
 ale:= random(100);
 writeln('el numero aleatorio generado es: ',ale,'    - i=', i);
end; 
end;

procedure incE(n, a, b: integer);
var
i: integer;
ale: integer;
begin
for i:= 1 to n do begin
 ale:= random(b-a + 1) + a;    // el + 1 es oara que incluya el límite sup. (se le suma el valor "a" al final, es una constante)
 writeln('el numero aleatorio generado es: ',ale,'    - i=', i);
 end;
end;

procedure incF(f, a, b: integer);
var
ale: integer;
begin
	ale := random(b-a + 1) + a;   // le pone un valor aleatorio a ale
	while(ale <> f) do begin
		writeln('el numero aleatorio generado es: ',ale); 
		ale := random(b-a) + a;   // se le asigna un nuevo valor aleatorio a ale
	end;
	writeln('Se leyo el numero: ',f);
	writeln('Se finaliza la lectura');
end;

var
a,b,n: integer;
begin
randomize;
readln(n);
readln(a);
readln(b);
//incD;
//incE(n,a,b); 
incF(n,a,b);
END.

