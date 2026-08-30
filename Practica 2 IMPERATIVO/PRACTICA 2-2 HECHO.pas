{2.- Escribir un programa que:

a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 200-230. Finalizar con el número 200.  HECHO

b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados. (seria un ag atras)  HECHO

c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados. HECHO

d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.  HECHO

e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.  HECHO}

program practica2_2;

type

lista = ^nodo;
nodo = record
dato: integer;
sig: lista;
end;

procedure agregarAtras(var l, ult: lista; num: integer);
var
nue: lista;
begin
	new(nue);
	nue^.dato:= num;
	nue^.sig:= nil;
	if(l = nil)then
		l:= nue
	else	
		ult^.sig:= nue;
	ult:= nue;
end;

procedure cargarListaRecursiva(var l: lista ; ale: integer; ult: lista);
begin
	ale:= random(230-200 + 1) + 200;        //num entre 200 y 230
	if(ale <> 200)then begin                // si se genera el 200 se termina de leer
		agregarAtras(l,ult,ale);    
		cargarListaRecursiva(l,ale,ult);
	end
	else
		writeln('Se leyo el numero ',ale,' (200)');
end;

procedure imprimirRecursivo(l: lista);
begin
	if(l <> nil)then begin
		writeln(l^.dato);
		imprimirRecursivo(l^.sig);   //IMPORTANTISIMO mandar como parametro l^.SIG, para ir achicando el problema
	end;	
end;

procedure imprimirRecursivoDesordenado(l: lista);
begin
	if(l <> nil)then begin
		imprimirRecursivoDesordenado(l^.sig);   // reduzco el problema
	    writeln(l^.dato);	
	end;    
end;

function ObtenerMinimoRecursivo(l: lista): integer;
var
aux: integer;
begin
	if(l <> nil)then begin
		aux:= ObtenerMinimoRecursivo(l^.sig);
		if(l^.dato < aux)then
			ObtenerMinimoRecursivo:= l^.dato
		else
			obtenerMinimoRecursivo:= aux;
	end
	else
		ObtenerMinimoRecursivo:= 999;    // usar el reesultado de la funcion para meter el valor en aux y usarlo como variable min
end;

function BuscarValorRecursivo(l: lista; valor: integer): boolean;
var
aux: boolean;
begin
	if(l <> nil)then begin
		aux:= BuscarValorRecursivo(l^.sig,valor);    // si se encuentra el dato una vez, ya queda el valor true en aux y siempre dara true;
		if(l^.dato = valor)then
			BuscarValorRecursivo:= true
		else
			BuscarValorRecursivo:= aux;
	end
	else
		BuscarValorRecursivo:= false;
end;




var
l: lista;
num: integer;
ult: lista;
min: integer;
esta: boolean;
valor: integer;

BEGIN
l:= nil;
num:= 0;

ult:= nil;   // esta bueno inicializar ult por las dudas sino da error
cargarListaRecursiva(l,num,ult);	

imprimirRecursivo(l);
writeln('-------------------------');
imprimirRecursivoDesordenado(l);

min:= obtenerMinimoRecursivo(l);
writeln('Minimo valor de la lista: ',min);

writeln('Ingrese el valor que quiera buscar en la lista');
readln(valor);	
esta:= BuscarValorRecursivo(l,valor);

if(esta)then
	writeln('VERDADERO --- El valor se encuentra en la lista')
else
	writeln('FALSO --- El valor no se encuentra en la lista');
	
END.

