{Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 6) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes
puntos:

a. Lea los datos de los productos y los almacene ordenados por código de
producto y agrupados por rubro, en una estructura de datos adecuada. El
ingreso de los productos finaliza cuando se lee el precio -1. HECHO

b. Una vez almacenados, muestre los códigos de los productos pertenecientes a
cada rubro. HECHO

c. Genere un vector (de a lo sumo 20 elementos) con los productos del rubro 3.
Considerar que puede haber más o menos de 20 productos del rubro 3.
Si la cantidad de productos del rubro 3 es mayor a 20, se debe almacenar los
primeros 20 que están en la lista e ignore el resto. HECHO

d. Ordenar, por precio, los elementos del vector generado en c) utilizando el
método visto en la teoría. HECHO

e. Muestre los precios del vector resultante del punto d). HECHO

f. Calcule el promedio de los precios del vector resultante del punto d). HECHO }


program untitled;

type

rangoRubros = 1..6;

producto = record
codigo: integer;
rubro: rangoRubros;
precio: real;
end;

lista =^nodo;
nodo = record
dato: producto;
sig: lista; 
end;

vector = array[rangoRubros]of lista;

vectorProductos = array[1..20]of producto;

procedure leerProducto(var p: producto);
begin
	writeln('ingrese un precio de producto');
	readln(p.precio);
	if(p.precio <> -1)then begin
		writeln('ingrese un codigo de producto');
		readln(p.codigo);
		writeln('ingrese un rubro del 1 al 6');
		readln(p.rubro);
	end;	
end;

procedure inicializarVector(var v: vector);
var
i: rangoRubros;
begin
	for i:= 1 to 6 do
		v[i]:= nil;
end;

procedure insertarOrdenado(var l: lista; p: producto);
var
ant,act,nue: lista;
begin
	new(nue);
	nue^.dato:= p;
	ant:= l;
	act:= l;
	while(act <> nil)and(p.codigo > act^.dato.codigo)do begin  // de menor a mayor
		ant:= act;
		act:= act^.sig;
	end;
	if(act = ant)then
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure cargarLista(var v: vector);
var
p: producto;
begin
	inicializarVector(v);
	leerProducto(p);
	while(p.precio <> -1)do begin
		insertarOrdenado(v[p.rubro],p);
		leerProducto(p);
	end;
end;

procedure imprimirCodigos(v: vector; var dimL: integer);
var
i: rangoRubros;
begin
	for i:= 1 to 6 do begin
		while(v[i] <> nil)do begin
			writeln('Rubro: ',i,' Codigo: ',v[i]^.dato.codigo);
			writeln;
			if(i = 3)then
				dimL:= dimL + 1;
			v[i]:= v[i]^.sig;
		end;	
	end;	
end;

procedure generarVector(v: vector; var vProductos: vectorProductos; dimL: integer; var pos: integer);
begin
	pos:= 0;
	while(v[3] <> nil)and(pos <= dimL)and(pos <= 20)do begin
		pos:= pos + 1;
		vProductos[pos]:= v[3]^.dato;   // le paso el producto
		v[3]:= v[3]^.sig;
	end;
end;

procedure ordenarVector(var v: vectorProductos; dimL: integer); 
var
i,j,p: integer;
item: producto;
begin
	for i:= 1 to (dimL-1)do begin
		p:= i;
		for j:= (i+1) to dimL do
			if(v[j].precio < v[p].precio)then p:= j;
	item:= v[p];
	v[p]:= v[i];
	v[i]:= item;		
	end;
end;

procedure imprimirVectorOrdenado(v: vectorProductos; dimL: integer; var suma: real);
var
i: integer;
begin
	writeln('Precios del VECTOR ORDENADO');
	writeln('--------------------');
	for i:= 1 to dimL do begin
		writeln('precio: ',v[i].precio:2:2);
		suma:= suma + v[i].precio;
	end;	
end;

function calcularPromedio(suma: real; dimL: integer): real;
begin
	calcularPromedio:= suma/dimL;   //dimL es la cantidad de productos del rubro 3, por ende la cantidad de precios
end;


var
v: vector;
dimL: integer;
vProductos: vectorProductos;
pos: integer;
suma: real;

BEGIN
dimL:= 0;
suma:= 0;
cargarLista(v);	
writeln;
writeln;
imprimirCodigos(v,dimL);
writeln;
if(dimL <> 0)then begin
writeln('dimL vale: ',dimL,' (es la cantidad de productos del rubro 3)');
writeln;


generarVector(v,vProductos,dimL,pos);

ordenarVector(vProductos,pos);

imprimirVectorOrdenado(vProductos,pos,suma);
writeln('--------------------');
writeln;
writeln;
writeln('Promedio de precios del rubro 3: ',calcularPromedio(suma,dimL):2:2);
end
else
	writeln('No hay productos del rubro 3');
END.

