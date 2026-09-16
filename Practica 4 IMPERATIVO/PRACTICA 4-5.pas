{5. Una veterinaria desea procesar la información de las consultas realizadas durante el año.


De cada consulta se conoce: número de consulta, número de historia clínica de la mascota,
fecha, tipo de consulta y costo de la consulta. La lectura de las consultas finaliza cuando se
ingresa el número de consulta -1.

Implementar un programa que invoque a los siguientes módulos y compruebe el correcto
funcionamiento del mismo.

a. Un módulo que retorne la información de las historias clínicas en un árbol binario de
búsqueda ordenado por número de historia clínica. Para cada historia clínica se debe
almacenar una lista con las consultas realizadas a la mascota correspondiente.

b. Un módulo que imprima recursivamente todas las historias clínicas en orden creciente
de número.

c. Un módulo que reciba el árbol y retorne el número de historia clínica con mayor
cantidad de consultas.

d. Un módulo que reciba el árbol y un número de historia clínica. Debe retornar la
cantidad total de consultas realizadas a dicha mascota.

e. Un módulo que reciba el árbol y un valor de costo. Debe retornar la cantidad de
consultas cuyo costo supera el valor recibido.

f. Un módulo que reciba el árbol y dos números de historia clínica. Debe retornar el costo
total de las consultas correspondientes a las historias clínicas comprendidas entre
ambos números, inclusive.

g. Un módulo que reciba el árbol y genere una nueva estructura ordenada por número de
historia clínica, donde cada historia aparezca una única vez junto con el costo total
acumulado de sus consultas.}


program practica4_5;

type

infoFecha = record
dia: integer;
mes: integer;
anio: integer;
end;

consulta = record
numero: integer;
numHistoria: integer;  // num historia clinica de una mascota
fecha: infoFecha;
tipo: integer;
costo: real;
end;

// ARBOL 1

infoLista = record
numero: integer;
fecha: infoFecha;
tipo: integer;
costo: real;
end;

listaConsultas = ^nodo;
nodo = record
dato: infoLista;
sig: listaConsultas;
end;

infoHistoria = record
numHistoria: integer;
lista: listaConsultas;
end;

arbol = ^nodoArbol;
nodoArbol = record
dato: infoHistoria;
HI: arbol;
HD: arbol;
end;

// ARBOL INCISO G

{g. Un módulo que reciba el árbol y genere una nueva estructura ordenada por número de
historia clínica, donde cada historia aparezca una única vez junto con el costo total
acumulado de sus consultas.}

infoCosto = record
numHistoria: integer;
costo: real;
end;

arbolCosto = ^nodoCosto;
nodoCosto = record
dato: infoCosto;
HI: arbolCosto;
HD: arbolCosto;
end;

{a. Un módulo que retorne la información de las historias clínicas en un árbol binario de
búsqueda ordenado por número de historia clínica. Para cada historia clínica se debe
almacenar una lista con las consultas realizadas a la mascota correspondiente.}

procedure leerConsulta(var c: consulta);
begin
	writeln('------NUEVO-----');
	writeln('Ingrese un numero de consulta');
	readln(c.numero);
	if(c.numero <> -1)then begin
			writeln('Ingrese un numero de historia clinica');
	        readln(c.numHistoria);
			writeln('Ingrese un dia de consulta');
	        readln(c.fecha.dia);
			writeln('Ingrese un mes de consulta');
	        readln(c.fecha.mes);
			writeln('Ingrese un anio de consulta');
	        readln(c.fecha.anio);	
			writeln('Ingrese un tipo de consulta');
	        readln(c.tipo);
			writeln('Ingrese un costo de consulta');
	        readln(c.costo);
	end;
end;

procedure agregarAdelante(var l: listaConsultas; c: consulta);
var
nue: listaConsultas;
begin
	new(nue);

	nue^.dato.numero:= c.numero;
	nue^.dato.fecha.dia:= c.fecha.dia;
	nue^.dato.fecha.mes:= c.fecha.mes;
	nue^.dato.fecha.anio:= c.fecha.anio;
	nue^.dato.tipo:= c.tipo;
	nue^.dato.costo:= c.costo;
	
	nue^.sig:= l;
	l:= nue;
end;

procedure insertarNodo(var a: arbol; c: consulta);
begin
	if(a = nil)then begin
		new(a);
		a^.dato.numHistoria:= c.numHistoria;    // una historia clinica
		a^.dato.lista:= nil;                    // crea una lista para el nuevo numHistoria
		agregarAdelante(a^.dato.lista, c);      // le paso la informacion al primer nodo de la lista
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else if(c.numHistoria = a^.dato.numHistoria)then        // si sigo con el mismo numHistoria, agrego un nuevo nodo
		agregarAdelante(a^.dato.lista,c)
	else if(c.numHistoria < a^.dato.numHistoria)then
		insertarNodo(a^.HI,c)                    // si el dato es menor, a la izquierda
	else if(c.numHistoria > a^.dato.numHistoria)then
		insertarNodo(a^.HD,c);                   // si es mayor o igual, a la derecha
end;

procedure generarArbol(var a: arbol);
var
c: consulta;
begin
	leerConsulta(c);
	while(c.numero <> -1)do begin
		insertarNodo(a,c);
		leerConsulta(c);
	end;
end;

{b. Un módulo que imprima recursivamente todas las historias clínicas en orden creciente
de número.}

procedure imprimirArbol(a: arbol);
begin
	if(a <> nil)then begin
		imprimirArbol(a^.HI);
		writeln('Historia clinica numero: ',a^.dato.numHistoria);
		imprimirArbol(a^.HD);
	end;
end;

{c. Un módulo que reciba el árbol y retorne el número de historia clínica con mayor
cantidad de consultas. ----> contar la cantidad de consultas}   // aca no me sirve el orden de creacion

procedure maximo(a: arbol; var max: integer; var numMax: integer);
var
l: listaConsultas;
cant: integer;
begin
	if(a <> nil)then begin
		cant:= 0;
		l:= a^.dato.lista;
		while(l <> nil)do begin
			cant:= cant + 1;
			l:= l^.sig;
		end;
		if(cant > max)then begin
			max:= cant;
			numMax:= a^.dato.numHistoria;
		end;
		maximo(a^.HI,max,numMax);
		maximo(a^.HD,max,numMax);
	end;	
end;

{d. Un módulo que reciba el árbol y un número de historia clínica. Debe retornar la
cantidad total de consultas realizadas a dicha mascota.}

function consultas(a: arbol; num: integer):integer;
var
l: listaConsultas;
cant: integer;
begin
	if(a = nil)then consultas:= 0
	else begin
		if(a^.dato.numHistoria = num)then begin
			l:= a^.dato.lista;
			cant:= 0;
			while(l <> nil)do begin
				cant:= cant + 1;
				l:= l^.sig;
			end;
			consultas:= cant;     // una vez que termina de recorrer esa lista YA ESTA, porque debe recorrer una sola historia clinica
		end
		else if(a^.dato.numHistoria > num)then
			consultas:= consultas(a^.HI, num)
		else if(a^.dato.numHistoria < num)then
			consultas:= consultas(a^.HD, num);
	end;
end;

{e. Un módulo que reciba el árbol y un valor de costo. Debe retornar la cantidad de
consultas cuyo costo supera el valor recibido.}

function cantidadCosto(a: arbol; costo: real): integer;
var
l: listaConsultas;
cant: integer;
begin
	if(a = nil)then cantidadCosto:= 0
	else begin
		l:= a^.dato.lista;
		cant:= 0;
		while(l <> nil)do begin
			if(l^.dato.costo > costo)then
				cant:= cant + 1;
			l:= l^.sig;
		end;	
		cantidadCosto:= cant + cantidadCosto(a^.HI,costo) + cantidadCosto(a^.HD,costo);  // busco en los otros nodos
	end;                                                                                 // no hace falta el else, porque debe recorrer todo y la variable cant queda en 0 si no hay nada
end;

{f. Un módulo que reciba el árbol y dos números de historia clínica. Debe retornar el costo
total de las consultas correspondientes a las historias clínicas comprendidas entre
ambos números, inclusive.}

function costoTotal(a: arbol; num1,num2: integer): real;
var
l: listaConsultas;
costo: real;
begin
	if(a = nil)then costoTotal:= 0
	else if(a^.dato.numHistoria >= num1)and(a^.dato.numHistoria <= num2)then begin
		l:= a^.dato.lista;
		costo:= 0;
		while(l <> nil)do begin
			costo:= costo + l^.dato.costo;
			l:= l^.sig;
		end;	
		costoTotal:= costo + costoTotal(a^.HI,num1,num2) + costoTotal(a^.HD,num1,num2);  // para cada lista, le sumo su costo total entre sus nodos
	end
	else if(a^.dato.numHistoria > num2)then
		costoTotal:= costoTotal(a^.HI,num1,num2)     // si se pasa del rango, proba con el HI
	else if(a^.dato.numHistoria < num1)then
		costoTotal:= costoTotal(a^.HD,num1,num2);    // si no llega al rango, proba con el HD
end;

{g. Un módulo que reciba el árbol y genere una nueva estructura ordenada por número de
historia clínica, donde cada historia aparezca una única vez junto con el costo total
acumulado de sus consultas.  ----> nuevo tipo de arbol}

procedure imprimirArbolCosto(a: arbolCosto);
begin
	if(a <> nil)then begin
		imprimirArbolCosto(a^.HI);
		writeln('----NUEVO NODO DEL ARBOL DE COSTOS----');
		writeln('Numero de historia clinica: ',a^.dato.numHistoria);
		writeln('Costo total de la historia clinica: ',a^.dato.costo:2:2);      // CORREGIR ACA TODO el inciso G
		imprimirArbolCosto(a^.HD);
	end;
end;

procedure insertarNodoCosto(var a: arbolCosto; numHistoria: integer; costo: real);
begin
	if(a = nil)then begin
		new(a);
		a^.dato.numHistoria:= numHistoria;
		a^.dato.costo:= costo;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else if(numHistoria = a^.dato.numHistoria)then
		a^.dato.costo:= a^.dato.costo + costo
	else if(numHistoria < a^.dato.numHistoria)then
		insertarNodoCosto(a^.HI,numHistoria,costo)
	else if(numHistoria > a^.dato.numHistoria)then
		insertarNodoCosto(a^.HD,numHistoria,costo);              
end;

procedure recorrerArbol(a: arbol; a2: arbolCosto);
var
l: listaConsultas;
begin
	if(a <> nil)then begin
		recorrerArbol(a^.HI,a2);          // recorrer todo el arbol en orden
		l:= a^.dato.lista;
		
		insertarNodoCosto(a2,a^.dato.numHistoria,l^.dato.costo);
		recorrerArbol(a^.HD,a2);
	end;
	
	imprimirArbolCosto(a2);
	
end;

procedure generarArbolCosto(a: arbol);
var
a2: arbolCosto;
begin
	a2:= nil;
	recorrerArbol(a,a2);
end;

// PRUEBA

procedure imprimirTodo(a: arbol);
var
l: listaConsultas;
begin
	if(a <> nil)then begin
		imprimirTodo(a^.HI);
		
		writeln('----NUEVO----');
		writeln('Num historia clinica ',a^.dato.numHistoria);
		l:= a^.dato.lista;
		while(l <> nil)do begin
			writeln('--NUEVO NODO--');
			writeln('numero de cliente: ',l^.dato.numero);
			writeln('dia: ',l^.dato.fecha.dia);
			writeln('mes: ',l^.dato.fecha.mes);
			writeln('anio: ',l^.dato.fecha.anio);
			writeln('costo de consulta: ',l^.dato.costo:2:2);
			writeln('tipo de diagnostico: ',l^.dato.tipo);
			l:= l^.sig;
		end;
		imprimirTodo(a^.HD);
	end;	
end;


// PROGRAMA PRINCIPAL

var
a: arbol;
max: integer;
numMax: integer;
num: integer;
costo: real;
num1,num2: integer;

BEGIN
a:= nil;
generarArbol(a);

if(a = nil)then
	writeln('Arbol vacio')
else begin

{imprimirTodo(a);

writeln;
writeln('---HISTORIAS CLINICAS ORDEN ASCENDENTE---');
imprimirArbol(a);                                              // 	INCISO B
writeln;

max:= -1;
maximo(a,max,numMax);
writeln('Num. de historia clinica con mayor cantidad de consultas: ',numMax);  // INCISO C
writeln;
writeln('Ingrese un numero de historia clinica para ver su cantidad de consultas');
readln(num);
writeln('Cantidad de consultas de la historia clinica numero ',num,': ',consultas(a,num));    // INCISO D
writeln;
writeln('Ingrese un valor de costo');
readln(costo);
writeln('Cantidad de consultas que superan el costo ',costo:2:2,': ',cantidadCosto(a,costo));  // INCISO E

writeln;
writeln('Ingrese un numero de historia clinica que sirva de limite inferior');
readln(num1);
writeln;
writeln('Ingrese un numero de historia clinica que sirva de limite superior');         
readln(num2);
writeln('Costo total de consultas entre los numeros de historia clinica ',num1,' y ',num2,' inclusive: ',costoTotal(a,num1,num2):2:2);    // INCISO F}

generarArbolCosto(a);      // INCISO G

end;
END.
