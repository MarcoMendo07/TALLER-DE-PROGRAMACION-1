{a) Implemente un módulo CargarListaOrdenada que cree una lista de
enteros y le agregue valores aleatorios entre el 100 y 150, hasta que se
genere el 120. Los valores dentro de la lista deben quedar ordenados
de menor a mayor. 

b) Implemente un módulo ImprimirLista que reciba una lista generada en
a) e imprima todos los valores de las posiciones impares de la lista en
el mismo orden que están almacenados.

c) Implemente un módulo BuscarElementoOrdenado que reciba la lista
generada en a) y un valor entero y retorne true si el valor se encuentra
en la lista y false en caso contrario.  (CREO QUE SE PUEDE MEJORAR LA BUSQUEDA) -----> PREGUNTAR

d) Invocar desde el programa principal a los módulos implementados
para crear una lista ordenada, mostrar todos sus elementos y
determinar si un valor leído por teclado se encuentra o no en la lista.

me saltee el ejercicio 3 pero es casi lo mismo que el 4 solo que se usa agregarAtras.
Por lo tanto, este ejercicio es una mezcla entre el 3 y el 4}


program practica0_4;

type

ListaEnteros = ^nodo;
nodo = record
 dato: integer;
 sig: listaEnteros;
end;

procedure insertarOrdenado(var l:listaEnteros; ale:integer);
var
nue: listaEnteros;
act, ant: listaEnteros; 
begin
new (nue);
nue^.dato := ale;
act := l; 
ant := l;
while( act <> nil)and(ale > act^.dato)do   // de menor a mayor
begin
ant := act;
act:= act^.sig;
end;
if (act = ant) then 
l:= nue
else
ant^.sig:= nue;
nue^.sig:= act;
end;

procedure CargarLista(var l:listaEnteros); // solo la lista
var
ale: integer;

begin
 l:= nil;
 ale:= random(150-100 + 1) + 100;
 while(ale <> 120) do begin
  insertarOrdenado(l, ale);       //agrego el nodo. Usamos insertarOrdenado para nodos de menor a mayor
  ale:= random(150-100 + 1) + 100;
 end;
 writeln('se leyo el numero: ',ale); // solo para comprobar que se leyo el valor de corte 120
end;

procedure ImprimirLista(l: listaEnteros);
var
pos: integer;
cantNodos: integer;

begin
cantNodos:= 0;
pos:= 0;
while(l <> nil)do begin
 pos:= pos + 1;
 if((pos MOD 2)= 1)then
  writeln('Numero: ',l^.dato,' Pos: ',pos);
 l:= l^.sig;
 cantNodos:= cantNodos + 1
 end;

writeln('Cantidad de Nodos: ',cantNodos); 
end;

function BuscarElementoOrdenado(l:listaEnteros; valor: integer):boolean;
var
ok: boolean;
begin
ok:= false;
while(l <> nil)do begin
 if(l^.dato = valor)then
  ok:= true;
 l:=l^.sig;
end;
BuscarElementoOrdenado:= ok;
end;

var
l: listaEnteros;
valor:integer;

BEGIN

randomize;
CargarLista(l);
ImprimirLista(l);

write('Escriba el valor que quiera buscar en la lista: ');
readln(valor);	

if(BuscarElementoOrdenado(l,valor))then
 writeln('devolvio true')
else
 writeln('devolvio false'); 
	
END.

