{2. Escribir un programa que:

a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto (entre 1 y 100), fecha (dia, mes, año) y cantidad de
unidades vendidas. Finalizar con el código de producto 0.
Un producto puede estar en más de una venta.

Se pide:

i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha. 

ii. Generar y retornar OTRO árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.

iii. Generar y retornar OTRO árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.

Nota: No repetir información!!!
Nota: El módulo debe retornar TRES árboles.

b. Implemente un módulo que reciba el árbol generado en i. y una fecha (día, mes y año) y
retorne la cantidad total de productos vendidos en la fecha recibida.

c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.

d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas. }



program practica3_2;

type
rangoCodigos = 0..100;

// 	ARBOL 1 ------------------

venta= record
cod: rangoCodigos;
dia: integer;
mes: integer;
anio: integer;
cant: integer;
end;

arbol = ^nodo;
nodo = record
dato: venta;
HI: arbol;
HD: arbol;
end;

// ARBOL 2 -------------------

infoProductos = record
cod: rangoCodigos;
cant: integer;
end;

arbolDos = ^nodoDos;
nodoDos = record
dato: infoProductos;
HI: arbolDos;
HD: arbolDos;
end;

// ARBOL 3 --------------------

listaVentas = ^nodoLista;
nodoLista = record
dato: arbol;              // puntero al nodo de venta del árbol 1, sin duplicar. tomara los mismos datos del arbol 1
sig: listaVentas;
end;

infoListaVentas = record
cod: rangoCodigos;
lista: listaVentas;
end;

arbolTres = ^nodoTres;
nodoTres = record
dato: infoListaVentas;
HI: arbolTres;
HD: arbolTres;
end;

procedure generarVenta(var v: venta);
begin
	v.cod := random(101);          // 0..100
	if(v.cod <> 0)then begin
		v.dia := random(31) + 1;
		v.mes := random(12) + 1;
		v.anio := random(2026-2000+1) + 2000;
		v.cant := random(50) + 1;
	end;
end;

procedure insertarNodo(var a: arbol; v: venta; var nodoNuevo: arbol);  // Arbol 1 de Ventas
begin
	if(a = nil)then begin
		new(a);
		a^.dato := v;
		a^.HI := nil;
		a^.HD := nil;
		
		nodoNuevo:= a;  // nodo nuevo recibe un puntero a los nodos del arbol 1
	end
	else if(v.cod < a^.dato.cod)then
		insertarNodo(a^.HI, v, nodoNuevo)
	else
		insertarNodo(a^.HD, v, nodoNuevo);
end;

procedure insertarNodo2(var a: arbolDos; v: venta);   // Arbol 2 de codigo y cantidades
begin
	if(a = nil)then begin
		new(a);
		a^.dato.cod := v.cod;
		a^.dato.cant := v.cant;
		a^.HI := nil;
		a^.HD := nil;
	end
	else if(v.cod = a^.dato.cod)then
		a^.dato.cant:= a^.dato.cant + v.cant	  // si sale el mismo codigo le sumo la nueva cantidad a la que ya habia	
	else if(v.cod < a^.dato.cod)then
		insertarNodo2(a^.HI, v)
	else
		insertarNodo2(a^.HD, v);
end;

procedure agregarAdelante(var l:listaVentas; nodoNuevo: arbol);
var
nue: listaVentas;
begin
	new(nue);
	nue^.dato:= nodoNuevo;          // genera nuevos nodos con nue, le pasa un puntero a los nodos del arbol 1 (cargados en nodoNuevo) y
	nue^.sig:= l;                   // los engancha con la lista de ventas del arbolTres
	l:= nue; 
end;

procedure insertarNodo3(var a: arbolTres; v: venta; nodoNuevo: arbol);  // Arbol 3 de codigo y lista de ventas del producto
begin
	if(a = nil)then begin       // SOLO entra aca cuando a es nil.
		new(a);
		a^.dato.cod := v.cod;
		a^.dato.lista := nil;   // inicializo la lista de ventas en nil
		a^.HI := nil;
		a^.HD := nil;
	end;
	
	if(v.cod = a^.dato.cod)then      // el dato que tiene a^.dato va cambiando a medida que se dan los llamados recursivos. puede entrar o no
		agregarAdelante(a^.dato.lista, nodoNuevo) 
		
	else if(v.cod < a^.dato.cod)then
		insertarNodo3(a^.HI, v, nodoNuevo)
	else
		insertarNodo3(a^.HD, v, nodoNuevo);
end;

procedure GenerarArbol(var a1: arbol; var a2: arbolDos; var a3: arbolTres);
var
	v: venta;
	nodoNuevo: arbol;
begin
	a1 := nil;
	a2 := nil;
	a3 := nil;

	generarVenta(v);
	while v.cod <> 0 do begin
		insertarNodo(a1, v, nodoNuevo);  // esta bien
		insertarNodo2(a2, v);            // esta bien
		insertarNodo3(a3, v, nodoNuevo); // esta bien. Recibe el puntero al nodo que se inserto en el arbol 1
		generarVenta(v);
	end;

end;

var
a1: arbol;
a2: arbolDos;
a3: arbolTres;
BEGIN
	randomize;
	GenerarArbol(a1, a2, a3);
	
	//RESOLVER EL RESTO DE INCISOS (b,c y d)
END.
