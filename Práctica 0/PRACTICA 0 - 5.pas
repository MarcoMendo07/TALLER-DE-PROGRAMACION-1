
program practica0_5;

type

RangoClientes = 1.. 500;
RangoActividades = 1.. 5;

vectorContador = array[RangoActividades] of integer;

asistencia = record
 dia:integer;
 mes:integer;
 anio:integer;
 cliente: integer; // RangoClientes me tira error
 actividad: Rangoactividades;
end;

listaAsistencias = ^nodo;
nodo = record
 dato: asistencia;
 sig: listaAsistencias;
end;

procedure insertarOrdenado(var l:listaAsistencias; a:asistencia);
var
nue: listaAsistencias;
act, ant: listaAsistencias; 
begin
new (nue);
nue^.dato := a;
act := l; 
ant := l;
while( act <> nil)and(a.cliente > act^.dato.cliente)do   // de menor a mayor
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

procedure GenerarDatos(var a: asistencia);
begin
a.dia:= random(30-1 + 1) + 1;
a.mes:= random(12-1 + 1) + 1;
a.anio:= random(2026-2000 + 1)+ 2000;
a.actividad:= random(5-1 + 1) + 1;
end;

procedure CargarLista(var l: listaAsistencias);
var
a: asistencia;
begin
l:= nil;
a.cliente:= random(500 + 1);
while(a.cliente <> 0)do begin
 GenerarDatos(a);
 insertarOrdenado(l,a);
 a.cliente:= random(500 + 1);
end;
writeln('se leyo el valor 0');
end;

procedure ImprimirLista(l:listaAsistencias);
begin
while(l <> nil)do begin
 writeln('---ASISTENCIA---');
 writeln('dia: ',l^.dato.dia);
 writeln('mes: ',l^.dato.mes);
 writeln('anio: ',l^.dato.anio);
 writeln('num cliente: ',l^.dato.cliente);
 writeln('actividad: ',l^.dato.actividad);

 l:= l^.sig;
end;

end;

procedure incisoC(l: listaAsistencias; valor: integer; var cantAsistencias: integer);
begin
while(l <> nil)do begin
 if(l^.dato.cliente = valor)then
  cantAsistencias:= cantAsistencias + 1;
 l:= l^.sig;
end;
end;

procedure inicializarVector(var vContador: vectorContador);
var
i: integer;
begin
for i:= 1 to 5 do
 vContador[i]:= 0;
end;

function incisoD(l: listaAsistencias; vContador: vectorContador):integer;
var
	max: integer;
	i: integer;
	actMax: integer;
begin
	max:= -1;
	while(l <> nil)do begin
		vContador[l^.dato.actividad]:= vContador[l^.dato.actividad] + 1;
		l:=l^.sig;
	end;

	for i:= 1 to 5 do begin
	 if(vContador[i] > max)then begin
	  max:= vContador[i];
	  actMax:= i;
	 end; 
	end;

	incisoD:= actMax;  
end;


var
l: listaAsistencias;
valor: integer;
cantAsistencias: integer;
vContador: vectorContador;

BEGIN
randomize;
CargarLista(l);
ImprimirLista(l);

cantAsistencias:= 0;
readln(valor);
incisoC(l,valor,cantAsistencias);
writeln('Cant. de asistencias del cliente Num:',valor,': ',cantAsistencias);

inicializarVector(vContador);
writeln('La actividad con mayor cantidad de asistencias es: ',incisoD(l,vContador));
	
END.

//analizar los CASOS LIMITE, por ejemplo si no se lee ningun valor en el vector o en la lista, siempre chequear para cada INCISO
