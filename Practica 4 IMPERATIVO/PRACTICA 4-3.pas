{3. Un centro cultural desea procesar la información de las inscripciones a los talleres que 
ofrece.

De cada inscripción se conoce: número de inscripción, código de taller, número de 
documento del participante y cantidad de clases a las que asistió.

La lectura de las inscripciones finaliza cuando se ingresa el número de inscripción -1. 
Implementar un programa que invoque a los siguientes módulos y  compruebe el correcto 
funcionamiento del mismo.  HECHO

a. Un módulo que retorne la información de los talleres en una estructura de datos // EL INCISO MAS LARGO
eficiente para la búsqueda por código de taller.

DE CADA TALLER deben almacenarse: código de taller, cantidad total de participantes inscriptos   // pueden ser pocos los talleres, se pueden repetir
y cantidad total de asistencias registradas.  HECHO (aprovecha cuando se repite un codigo)

b. Un módulo que imprima el contenido de la estructura ordenado por código de taller.  // PROCEDIMIENTO enOrden que imprima TODO

c. Un módulo que retorne el código del taller con mayor cantidad de participantes 
inscriptos.  // calcular un maximo. NO me sirve el criterio de orden

d. Un módulo que retorne la cantidad de talleres cuyos códigos sean menores que un 
valor recibido como parámetro. HECHO

e. Un módulo que retorne la cantidad total de asistencias correspondientes a los talleres 
cuyos códigos se encuentren comprendidos entre dos valores recibidos como 
parámetros, sin incluir dichos valores. HECHO }

program practica4_3;

type

inscripcion = record
numero: integer;
cod: integer;
dni: integer;
clases: integer;
end;

taller = record
cod: integer;
inscriptos: integer;
asistencias: integer;
end;

arbol = ^nodo;     // generar ordenado por codigo. ARBOL DE TALLERES
nodo = record
dato: taller;
HI: arbol;
HD: arbol;	
end;

// INCISO A

procedure leerInscripcion(var i: inscripcion);
begin
	writeln('Ingrese un numero de inscripcion');
	readln(i.numero);
	if(i.numero <> -1)then begin
		writeln('Ingrese un codigo de taller');
		readln(i.cod);
		writeln('Ingrese un DNI');
		readln(i.dni);
		writeln('Ingrese la cant de clases a las que asistio la persona del DNI anterior');
		readln(i.clases);
	end;
end;

procedure inicializarTaller(var t: taller; i: inscripcion);
begin
	t.cod:= i.cod;
	t.inscriptos:= 1;             // estos son los datos que le llegan a UN TALLER a partir de UNA inscripcion, luego se ve q hacer si se repite el codigo de taller
	t.asistencias:= i.clases;
end;

procedure insertarNodo(var a: arbol; i: inscripcion);
var
t: taller;
begin
	if(a = nil)then begin     // inserto un nodo. Si entra en este CASO, es qu el arbol esta vacio o es un TALLER nuevo (cod de taller nuevo)
		new(a);
		inicializarTaller(t,i);
		a^.dato:= t;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else if(i.cod = a^.dato.cod)then begin      // ES DECIR, si la nueva inscripcion que entra tiene el mismo codigo de taller que ya habia en un nodo del arbol
		a^.dato.inscriptos:= a^.dato.inscriptos + 1;   // una nueva persona que se inscribe en el taller;
		a^.dato.asistencias:= a^.dato.asistencias + i.clases;               // le sumo las asistencias de la nueva persona
	end
	else if(i.cod < a^.dato.cod)then      // ahora si de menor a mayor (i es el dato q entra) 
		insertarNodo(a^.HI, i)            // LOS CASOS RECURSIVOS	
	else
		insertarNodo(a^.HD, i);
end;

procedure generarArbol(var a: arbol);
var
i: inscripcion;

begin
	a:= nil;
	leerInscripcion(i);
	while(i.numero <> -1)do begin
		insertarNodo(a,i);
		leerInscripcion(i);
	end;
end;

// INCISO B

procedure imprimirArbol(a : arbol);
begin
	if(a <> nil)then begin
		imprimirArbol(a^.HI);
		writeln('------NUEVO TALLER------');
		writeln('Codigo de taller: ',a^.dato.cod);
		writeln('Inscripciones totales: ',a^.dato.inscriptos);
		writeln('Asistencias registradas: ',a^.dato.asistencias);
		imprimirArbol(a^.HD);
	end;
end;

// INCISO C

function maximo(a: arbol; max: integer): integer;
begin
	if(a <> nil)then begin
		if(a^.dato.asistencias > max)then maximo:= a^.dato.cod;
		maximo(a^.HI, max);
	    maximo(a^.HD, max);                   // NO PUEDO acotar la funcion porque el criterio de orden es por orden de codigo. tengo q recorrer todo el arbol igual
	end;                                      // no me sirve el criterio de orden que tiene el arbol
end;

// INCISO D

{d. Un módulo que retorne la cantidad de talleres cuyos códigos sean menores que un 
valor recibido como parámetro. }

function menores(a: arbol; valor: integer): integer;   // RECORDAR QUE EL PUNTERO DEL ARBOL QUEDA EN LA RAIZ
begin
	if(a = nil)then
		menores:= 0
	else if(a^.dato.cod < valor)then
		menores:= 1 + menores(a^.HI,valor) + menores(a^.HD,valor)
	else
		menores:= menores(a^.HI,valor);    // Si el dato no es menor, PROBA CON EL HIJO IZQUIERDO
end;

// INCISO E

{e. Un módulo que retorne la cantidad total de asistencias correspondientes a los talleres 
cuyos códigos se encuentren comprendidos entre dos valores recibidos como 
parámetros, sin incluir dichos valores.}

function asistencias(a: arbol; codigo1,codigo2: integer): integer;
begin
	if(a = nil)then asistencias:= 0
	else begin
		if(a^.dato.cod > codigo1)and(a^.dato.cod < codigo2)then      // mayor y menor estrictor porque es sin incluir los limites
			asistencias:= a^.dato.asistencias + asistencias(a^.HI,codigo1,codigo2) + asistencias(a^.HD,codigo1,codigo2)
		else
			if(a^.dato.cod >= codigo2)then  
				asistencias:= asistencias(a^.HI,codigo1,codigo2)    // si se pasa del rango proba con el HIJO IZQUIERDO
			else if(a^.dato.cod <= codigo1)then
				asistencias:= asistencias(a^.HD,codigo1,codigo2);    // si se queda corto proba con el HIJO DERECHO
	end;
	
end;


var
a: arbol;
max: integer;	
valor: integer;
codigo1, codigo2: integer;
	
BEGIN	
generarArbol(a);	
imprimirArbol(a);
max:= -1;	
writeln;
writeln('El codigo de taller con mas inscripciones es: ',maximo(a,max));	
writeln;
writeln('Ingrese un valor para buscar codigos menores al mismo');
readln(valor);
writeln;
writeln('Cantidad de codigos de taller menores al valor ',valor,' : ',menores(a,valor));

writeln('Ingrese un codigo para usar de limite inferior');
readln(codigo1);
writeln('Ingrese un codigo para usar de limite superior');
readln(codigo2);
writeln;
writeln('Cantidad total de asistencias de los talleres entre los codigos ',codigo1,' y ',codigo2,' : ',asistencias(a,codigo1,codigo2));

	
END.
