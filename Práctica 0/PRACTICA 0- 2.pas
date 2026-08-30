
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

var
a,b: integer;  // limites
vEnteros: vectorEnteros;
pos: integer;

BEGIN
pos:= 0;

randomize;
readln(a);
readln(b);     // b es el valor maximo
CargarVector(a,b,pos,vEnteros);
ImprimirVector(vEnteros,pos);	
END.

