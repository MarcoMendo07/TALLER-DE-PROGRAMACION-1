{2. Escribir un programa que:

a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.

Para cada venta generar código de producto (entre 1 y 100), fecha (dia, mes, año) y cantidad de
unidades vendidas. Finalizar con el código de producto 0.
Un producto puede estar en más de una venta. HECHO

Se pide:

i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.   HECHO

ii. Generar y retornar OTRO árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.  ACA (calcular la suma total de todas las unidades vendidas en OTRO MODULO) 

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

// info para ARBOL 1

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

// info para ARBOL 2

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

// info para ARBOL 3

listaVentas = ^nodoLista;
nodoLista = record
dato: venta;                 // seran solo las ventas de determinado codigo de prod.
sig: listaVentas;
end;

infoListaVentas = record     // dato para arbol 3
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
	v.cod:= random(102)-1;      // seria de 1 hasta 101 pero siempre le resto 1, entonces queda de 0 a 100
	
	{writeln('Ingrese un codigo de venta (cod 0 para Finalizar)');
	readln(v.cod);}
	
	if(v.cod <> 0)then begin
		v.dia:= random(30+1);                 //hasta 30
		v.mes:= random(12+1);                 //hasta 12
		v.anio:= random(2026-2000+1) + 2000;  //entre el 2000 y el 2026
		v.cant:= random(50+1);                //hasta 50
	end;
end;

procedure insertarNodo(var a: arbol; v: venta);
begin
	if(a = nil)then begin
		new(a);
		a^.dato:= v;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else if(v.cod < a^.dato.cod)then      // menor estricto, ya que si el elem es IGUAL (repetido) tiene que ir a la derecha
			insertarNodo(a^.HI, v)
		else
			insertarNodo(a^.HD, v);
end;


procedure insertarNodo2(var a: arbolDos; v: venta);   // arma el arbol 2 con sus dos campos para cada nodo HECHO
begin
	if(a = nil)then begin
		new(a);
		a^.dato.cod:= v.cod;
		a^.dato.cant:= v.cant; 
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else if(v.cod < a^.dato.cod)then    
			insertarNodo2(a^.HI, v)
		else
			insertarNodo2(a^.HD, v);
end;

{procedure insertarNodo3(var a: arbolTres; v: venta);
begin
	if(a = nil)then begin
		new(a);
		a^.dato.cod:= v.cod;
		a^.dato.cant:= v.cant; 
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else if(v.cod < a^.dato.cod)then    
			insertarNodo3(a^.HI, v)
		else
			insertarNodo3(a^.HD, v);
end;} 

{procedure corteDeControl(a1: arbol; var a2: arbolDos; var a3: arbolTres; var suma: integer);  // a1 ya esta ordenado por codigo
var
codAct: rangoCodigos;
begin
	while(a1 <> nil)do begin
	codAct


end;}



procedure enOrden(a1: arbol; var a2: arbolDos; var a3: arbolTres; var suma: integer);   //hacerlo tipo corte de control
var
codAct: rangoCodigos;
begin
	if(a1 <> nil)then begin
		enOrden(a1^.HI,a2,a3);
		
		codAct:= a1^.dato.codigo;      // primero va a tener el codigo del HI, y dsp el del HD
	
		if(a1 <> nil)and(a1^.dato.codigo = codAct
		corteDeControl(a1, a2, a3, suma);
		
		{insertarNodo2(a2,a1^.dato);
	    insertarNodo3(a3,a1^.dato);}

		enOrden(a1^.HD,a2,a3);
	end;
end;


procedure GenerarArbol(var a1: arbol; var a2: arbolDos; var a3: arbolTres);    //no hace falta hacer lo de conjuntos porque se puede repetir el codigo de venta
var
v: venta;                                                                      //creo q tengo q generar el primer arbol y dsp recorrerlo
suma: integer;
begin
	a1:= nil;  // ya esta generado
	a2:= nil;
	a3:= nil;
	
	generarVenta(v);
	while(v.cod <> 0)do begin
		insertarNodo(a1,v);
		generarVenta(v);
	end;

	suma:= 0;
	enOrden(a1,a2,a3,suma);

end;

var
a1: arbol;
a2: arbolDos;
a3: arbolTres;

BEGIN
randomize;
GenerarArbol(a1,a2,a3);


END.

