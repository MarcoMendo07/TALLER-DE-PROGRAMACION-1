{4. Una empresa de alquiler de bicicletas desea procesar la información de los alquileres
realizados durante un mes.  // un mes (30 dias)

De cada alquiler se conoce: código de bicicleta, número de cliente, día del alquiler, cantidad de horas alquiladas e importe abonado. La lectura de los
alquileres finaliza cuando se ingresa el código de bicicleta 0. 

Implementar un programa que invoque a los siguientes módulos y compruebe el correcto
funcionamiento del mismo.

a. Un módulo que lea los alquileres y genere dos estructuras de datos, ambas eficientes
para la búsqueda por código de bicicleta:

i. En la primera estructura, cada alquiler debe almacenarse en un nodo diferente del
árbol. Si se ingresa nuevamente un alquiler para una bicicleta cuyo código ya se
encuentra en el árbol, el nuevo alquiler deberá insertarse a la derecha.  // insertar SIEMPRE que se lea un alquiler

ii. En la segunda estructura, cada nodo debe contener un código de bicicleta una sola
vez y una lista con todos los alquileres realizados para dicha bicicleta. ----> insertar los nodos contemplando si son iguales, y mandar a la lista un puntero al arbol 1

Nota: Prestar especial atención a los datos que se almacenan en cada estructura para
evitar repetir información innecesariamente.  // arbol de bicicletas, con lista de informacion  HECHO

b. Un módulo recursivo que reciba la estructura generada en i) y retorne el código de
bicicleta más grande.

c. Un módulo recursivo que reciba la estructura generada en ii) y retorne el código de
bicicleta más pequeño.

d. Un módulo recursivo que reciba la estructura generada en i) y un número de cliente.
Debe retornar la cantidad de alquileres realizados por dicho cliente.

e. Un módulo recursivo que reciba la estructura generada en ii) y un número de cliente.
Debe retornar la cantidad de alquileres realizados por dicho cliente. -----> MAS DIFICIL, porque tiene que buscar en la lista de alquileres de cada bicicleta

f. Un módulo que reciba la estructura generada en i) y genere una nueva estructura
ordenada por código de bicicleta, donde cada código aparezca una única vez junto con
la cantidad total de horas alquiladas.  HECHO

g. Un módulo que reciba la estructura generada en ii) y genere una nueva estructura
ordenada por código de bicicleta, donde cada código aparezca una única vez junto con
la cantidad total de horas alquiladas. AHORA CON EL ARBOL 2

h. Un módulo recursivo que reciba la estructura generada en g) y muestre su contenido.

i. Un módulo recursivo que reciba la estructura generada en i) y dos códigos de bicicleta.
Debe retornar el importe total recaudado por los alquileres de las bicicletas cuyos
códigos se encuentren comprendidos entre los dos valores recibidos, inclusive.

j. Un módulo recursivo que reciba la estructura generada en ii) y dos códigos de bicicleta.
Debe retornar el importe total recaudado por los alquileres de las bicicletas cuyos
códigos se encuentren comprendidos entre los dos valores recibidos, inclusive.}

program practica4_4;

type

alquiler = record
cod: integer;
numero: integer;
dia: integer;
horas: integer;
importe: real;
end;

// PRIMERA ESTRUCTURA

arbol = ^nodoArbol;       // arbol de alquileres
nodoArbol = record
dato: alquiler;
HI: arbol;
HD: arbol;
end;

// SEGUNDA ESTRUCTURA

listaAlquileres = ^nodo;   // lista
nodo = record
dato: arbol;               // tendra como dato un puntero al nodo del arbol 1 QUE TIENE al dato alquiler 
sig: listaAlquileres;
end;

bicicleta = record        // registro del arbolDos, contiene una lista
cod: integer;
lista: listaAlquileres;
end;

arbolDos = ^nodoArbolDos;  // arbol de bicicletas
nodoArbolDos = record
dato: bicicleta;
HI: arbolDos;
HD: arbolDos;
end;

// PARA EL INCISO F

infoHoras = record
cod: integer;
horas: integer;
end;

arbolHoras = ^nodoHoras;
nodoHoras = record
dato: infoHoras;
HI: arbolHoras;
HD: arbolHoras;
end;

// INCISO A

procedure cargarDatos(var a: alquiler);
begin
	writeln('-------NUEVO-------');
	writeln('Ingrese un codigo de bicicleta');
	readln(a.cod);
	if(a.cod <> 0)then begin
		writeln('Ingrese un numero de cliente');
		readln(a.numero);
		writeln('Ingrese el dia del alquiler');
	    readln(a.dia);
		writeln('Ingrese la cantidad de horas alquiladas');
	    readln(a.horas);
	    writeln('Ingrese el importe abonado');
	    readln(a.importe);
	end;
end;

procedure insertarNodo(var a: arbol; alq: alquiler; var punt: arbol);
begin
	if(a = nil)then begin
		new(a);
		a^.dato:= alq;
		a^.HI:= nil;
		a^.HD:= nil;
		
		punt:= a;    // puntero al nodo del arbol
	end
	else begin
		if(alq.cod < a^.dato.cod)then
			insertarNodo(a^.HI,alq,punt)
		else	
			insertarNodo(a^.HD,alq,punt)  // mayor o igual
	end;		
end;

procedure agregarAdelante(var l: listaAlquileres; punt: arbol);
var
nue: listaAlquileres;
begin
	new(nue);
	nue^.dato:= punt;
	nue^.sig:= l;
	l:= nue;
end;

procedure insertarNodo2(var a: arbolDos; alq: alquiler; punt: arbol);
begin
	if(a = nil)then begin
		new(a);
		a^.dato.cod:= alq.cod; // el codigo ya lo mando aca, queda una sola vez
		a^.dato.lista:= nil;   //inicializo la lista en nil
		a^.HI:= nil;
		a^.HD:= nil;
	end;

	if(alq.cod = a^.dato.cod)then
		agregarAdelante(a^.dato.lista, punt)    // para armar la lista de alquileres. Si entra al if, no agrega un nodo nuevo
		
	else if(alq.cod < a^.dato.cod)then
		insertarNodo2(a^.HI,alq,punt)
	else	
		insertarNodo2(a^.HD,alq,punt)           // SI sale un codigo repetido, se AGREGARA A LA DERECHA (HD). como pide el enunciado
end;

procedure generarArboles(var a1: arbol; var a2: arbolDos);
var
alq: alquiler;
punt: arbol;
begin
	a1:= nil;
	a2:= nil;
	cargarDatos(alq);
	while(alq.cod <> 0)do begin
		insertarNodo(a1,alq,punt);
		insertarNodo2(a2,alq,punt);
		cargarDatos(alq)
	end;
end;

// INCISO B

function maximo(a: arbol): integer;
begin
	if(a = nil)then
		maximo:= -1
	else if(a^.HD = nil)then maximo:= a^.dato.cod
						else maximo:= maximo(a^.HD);    // los codigos mas grandes estan a la derecha
end;

// INCISO C

function minimo(a: arbolDos): integer;
begin
	if(a = nil)then
		minimo:= 9999
	else if(a^.HI = nil)then minimo:= a^.dato.cod
						else minimo:= minimo(a^.HI);
end;

// INCISO D

function cantAlquileres(a: arbol; valor: integer):integer;
begin
	if(a = nil)then cantAlquileres:= 0
	else
		if(a^.dato.numero = valor)then 
			cantAlquileres:= 1 + cantAlquileres(a^.HI, valor) + cantAlquileres(a^.HD, valor)
		else
			cantAlquileres:= cantAlquileres(a^.HI, valor) + cantAlquileres(a^.HD, valor);
end;

// INCISO E

{e. Un módulo recursivo que reciba la estructura generada en ii) y un número de cliente.
Debe retornar la cantidad de alquileres realizados por dicho cliente.  -----> MAS DIFICIL, porque tiene que buscar en la lista de alquileres de cada bicicleta}  

procedure cantAlquileres2(a: arbolDos; valor: integer; var cant: integer);
var
numeroCliente: integer;
l: listaAlquileres;
begin
	if(a <> nil)then begin
		l:= a^.dato.lista;          // l es la lista de este nodo del arbol, que es una bicicleta
		while(l <> nil)do begin
			numeroCliente:= l^.dato^.dato.numero;  // es el numero de cliente que esta registrado en ese alquiler en la lista
			if(numeroCliente = valor)then begin
				writeln('ENCONTRO');
				cant:= cant + 1;
			end;	
			l:= l^.sig;	
		end;
		cantAlquileres2(a^.HI, valor,cant);
		cantAlquileres2(a^.HD, valor,cant);	
	end;
end;

// IMPRIMIR 2 PRIMEROS ARBOLES

procedure imprimirArbol(a: arbol);
begin
	if(a <> nil)then begin
		imprimirArbol(a^.HI);
		writeln('-----NUEVO-----');
		writeln('Codigo: ',a^.dato.cod);
		writeln('Numero de cliente: ',a^.dato.numero);
		writeln('Dia: ',a^.dato.dia);
		writeln('Horas alquiladas: ',a^.dato.horas);
		writeln('Importe: ',a^.dato.importe:2:2);
		imprimirArbol(a^.HD);
	end;
end;

procedure imprimirArbolDos(a: arbolDos);   // todo de izquierda a derecha
var
l: listaAlquileres;
alq: alquiler;
begin
	if(a <> nil)then begin
		imprimirArbolDos(a^.HI);
		
		alq:= a^.dato.lista^.dato^.dato;   // el alquiler del nodo del arbol 1
		l:= a^.dato.lista;
		
		writeln('-----NUEVO CODIGO-----');
		writeln('CODIGO: ',a^.dato.cod);
		while(l <> nil)do begin
			writeln('---NUEVO ALQUILER---');
			writeln('Numero de cliente: ',alq.numero);
			writeln('Dia: ',alq.dia);
			writeln('Horas alquiladas: ',alq.horas);
			writeln('Importe: ',alq.importe:2:2);
			l:= l^.sig;	
		end;
		imprimirArbolDos(a^.HD);
	end;
end;

// INCISO F

{f. Un módulo que reciba la estructura generada en i) y genere una nueva estructura
ordenada por código de bicicleta, donde cada código aparezca una única vez junto con
la cantidad total de horas alquiladas.  Generar un arbolHoras}

procedure insertarNodoHoras(var a: arbolHoras; cod: integer; horas: integer);
begin
	if(a = nil)then begin
		new(a);
		a^.dato.cod:= cod;
		a^.dato.horas:= horas;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else if(a^.dato.cod = cod)then              // si es igual al codigo q entra
		a^.dato.horas:= a^.dato.horas + horas   // le sumo las horas que entran (del mismo codigo) 
	else if(cod < a^.dato.cod)then
		insertarNodoHoras(a^.HI,cod,horas)
	else
		insertarNodoHoras(a^.HD,cod,horas);
end;

procedure generarArbolHoras(a: arbol; var a3: arbolHoras);
begin
	if(a <> nil)then begin
		generarArbolHoras(a^.HI,a3);
		insertarNodoHoras(a3,a^.dato.cod, a^.dato.horas);    // aca le esta mandando siempre el mismo arbolHoras, pero le manda distintos codigos y horas
		generarArbolHoras(a^.HD,a3);
	end;
end;

// INCISO G

{g. Un módulo que reciba la estructura generada en ii) y genere una nueva estructura
ordenada por código de bicicleta, donde cada código aparezca una única vez junto con
la cantidad total de horas alquiladas. AHORA CON EL ARBOL 2}

procedure generarArbolHorasDos(a2: arbolDos; var a4: arbolHoras);
var
l: listaAlquileres;
codigo: integer;
horas: integer;
begin
	if(a2 <> nil)then begin
		generarArbolHorasDos(a2^.HI, a4);
		l:= a2^.dato.lista;
		while(l <> nil)do begin
			codigo:= l^.dato^.dato.cod;
			horas:=  l^.dato^.dato.horas;	
			
			insertarNodoHoras(a4, codigo, horas);    // uso el modulo implementado en el inciso F
		
			l:= l^.sig;
		end;
		generarArbolHorasDos(a2^.HD, a4);
	end;
end;

// INCISO H

procedure imprimirArbolHoras(a: arbolHoras);       
begin
	if(a <> nil)then begin
		imprimirArbolHoras(a^.HI);
		writeln('-----NUEVO-----');
		writeln('Codigo: ',a^.dato.cod);
		writeln('Horas totales alquiladas: ',a^.dato.horas);
		imprimirArbolHoras(a^.HD);
	end;
end;

// INCISO I

{i. Un módulo recursivo que reciba la estructura generada en i) y dos códigos de bicicleta.
Debe retornar el importe total recaudado por los alquileres de las bicicletas cuyos
códigos se encuentren comprendidos entre los dos valores recibidos, inclusive.}

function entreDosValores(a: arbol; codigo1, codigo2: integer): real;
begin
	if(a = nil)then entreDosValores:= 0
	else
		if(a^.dato.cod >= codigo1)and(a^.dato.cod <= codigo2)then      // uso menor igual para incluir los limites
			entreDosValores:= a^.dato.importe + entreDosValores(a^.HI,codigo1,codigo2) + entreDosValores(a^.HD,codigo1,codigo2)
		else if(a^.dato.cod > codigo2)then
			entreDosvalores:= entreDosValores(a^.HI,codigo1,codigo2)   // si se pasa del rango proba con el HI
		else if(a^.dato.cod < codigo1)then	
			entreDosvalores:= entreDosValores(a^.HD,codigo1,codigo2);  // si no llega proba con el HD
end;

// INCISO J

{j. Un módulo recursivo que reciba la estructura generada en ii) y dos códigos de bicicleta.
Debe retornar el importe total recaudado por los alquileres de las bicicletas cuyos
códigos se encuentren comprendidos entre los dos valores recibidos, inclusive.}

function entreDosValoresDos(a: arbolDos; codigo1, codigo2: integer): real;
var
l: listaAlquileres;
codigo: integer;
importe: real;
begin
	if(a = nil)then entreDosValoresDos:= 0
	else begin
		l:= a^.dato.lista;
		while(l <> nil)do begin
			codigo:= l^.dato^.dato.cod;
			importe:= l^.dato^.dato.importe;
			
			if(codigo >= codigo1)and(codigo <= codigo2)then
				entreDosValoresDos:= importe + entreDosValoresDos(a^.HI,codigo1,codigo2) + entreDosValoresDos(a^.HD,codigo1,codigo2) 
			else if(codigo > codigo2)then
				entreDosValoresDos:= entreDosValoresDos(a^.HI,codigo1,codigo2)
			else if(codigo < codigo1)then
				entreDosValoresDos:= entreDosValoresDos(a^.HD,codigo1,codigo2);
			l:= l^.sig;
		end;
	end;
end;

var
a1: arbol;
a2: arbolDos;
cliente: integer;
cant: integer;
a3: arbolHoras;   // podria ser una lista que le inserto ordenado los nodos
a4: arbolHoras;
codigo1, codigo2: integer;

BEGIN
generarArboles(a1,a2);                                       // INCISO A

writeln('-------------ARBOL 1------------');          
writeln;
imprimirArbol(a1);
writeln;

writeln('--------AHORA EL ARBOL 2--------');
writeln;
imprimirArbolDos(a2);

writeln;
writeln('Codigo maximo del arbol 1: ',maximo(a1));          // INCISO B
writeln;
writeln('Codigo minimo del arbol 2: ',minimo(a2));          // INCISO C

writeln;
writeln('Ingrese un numero de cliente para ver sus alquileres realizados: ');
readln(cliente);
writeln;
writeln('Cant de alquileres del cliente num ',cliente,' : ',cantAlquileres(a1,cliente));  // INCISO D

writeln;
writeln('Ingrese otro numero de cliente para ver sus alquileres realizados: ');
readln(cliente);
writeln;
cant:= 0;
cantAlquileres2(a2,cliente,cant);
writeln('Cant de alquileres del cliente num ',cliente,' : ',cant);     // INCISO E

a3:= nil;
generarArbolHoras(a1,a3);
writeln;
writeln('--------AHORA EL ARBOL DE HORAS--------');           // INCISO F
writeln;
imprimirArbolHoras(a3);

a4:= nil;
generarArbolHorasDos(a2,a4);
writeln;
writeln('--------AHORA EL SEGUNDO ARBOL DE HORAS--------');   // INCISO G
writeln;
imprimirArbolHoras(a4);                                       // INCISO H

writeln;
writeln('Ingrese un codigo que sirva de limite inferior: ');
readln(codigo1);
writeln;
writeln('Ingrese un codigo mas grande que sirva de limite superior: ');   // INCISO I
readln(codigo2);
writeln;
writeln('Importe total entre el codigo ',codigo1,' y el codigo ',codigo2,' inclusive: ',entreDosValores(a1,codigo1,codigo2):2:2);

writeln;
writeln;
writeln('Ingrese otro codigo que sirva de limite inferior: ');
readln(codigo1);
writeln;
writeln('Ingrese otro codigo mas grande que sirva de limite superior: ');   // INCISO J
readln(codigo2);
writeln;
writeln('Importe total entre el codigo ',codigo1,' y el codigo ',codigo2,' inclusive: ',entreDosValoresDos(a2,codigo1,codigo2):2:2);
	
END.

