{a) Implemente un módulo CargarVector que cree un vector de enteros
con a lo sumo 50 valores aleatorios. Los valores, generados
aleatoriamente (entre un mínimo y máximo recibidos por parámetro),
deben ser almacenados en el vector en el mismo orden que se
generaron, hasta que se genere el valor máximo.

b) Implemente un módulo ImprimirVector que reciba el vector generado
en a) e imprima todos los valores de las posiciones pares del vector en
el mismo orden que están almacenados. ¿Qué cambiaría para imprimir
en orden inverso?   ---> para imprimir en orden inverso uso downto

c) Escriba el cuerpo principal que invoque a los módulos ya
implementados.}


program practica0_2;
type

vectorEnteros = array[1.. 50] of integer;

procedure CargarVector(a,b:integer; var pos:integer ; var vEnteros: vectorEnteros);
var
ale: integer;
begin
 ale:= random(b-a + 1) + a;
 while(ale <> b)do begin
  pos:= pos + 1;
  vEnteros[pos]:= ale;
  ale:= random(b-a + 1) + a;
 end;
 
 writeln('Salio el numero: ',ale,' en la pos: ',pos + 1);   // simplemente para confirmar que salio b y en que posicion
 
end;

procedure ImprimirVector(vEnteros: vectorEnteros; pos: integer);
var
i: integer;
begin
 for i:= 1 to pos do begin
  if((i MOD 2) = 0)then
   writeln('Numero: ',vEnteros[i],' Pos: ',i);
 end;
end;

procedure ImprimirVectorAlReves(vEnteros: vectorEnteros; pos: integer);
var
i: integer;
begin
 for i:= pos downto 1 do begin
	if((i MOD 2) = 0)then
		writeln('Numero: ',vEnteros[i],' Pos: ',i);
	end;
end;


var
a,b: integer;  // limites
vEnteros: vectorEnteros;
pos: integer;  // seria la dimL creo

BEGIN
pos:= 0;

randomize;
readln(a);
readln(b);     // b es el valor maximo
CargarVector(a,b,pos,vEnteros);
ImprimirVector(vEnteros,pos);	

writeln('------------------------');
ImprimirVectorAlReves(vEnteros,pos);
END.

