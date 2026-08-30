{4.- Implementar un programa que invoque a los siguientes módulos.

a. Un módulo recursivo que retorne un vector de 30 números enteros “random” mayores a 300
y menores a 550 (incluidos ambos). HECHO

b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
en la práctica anterior) HECHO

c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice); 
Nota: El parámetro “pos” debe retornar la posición del dato o el valor -1 si el dato no se
encuentra en el vector. HECHO} 


program practica2_4;

type

vector = array[1..30] of integer;

procedure cargarVectorRecursivo(var v: vector; dimL: integer);
var
ale: integer;
begin
	ale:= random(550-300 + 1) + 300;     // siempre (b-a + 1) + a ( el + 1 es para incluir el 550)
	if(dimL <= 30)then begin
		v[dimL]:= ale;
		cargarVectorRecursivo(v, dimL+1);
	end;
end;

procedure imprimirVector(v: vector);
var
i: integer;
begin
	for i:= 1 to 30 do
		writeln('Elemento numero ',i,' Valor: ',v[i]);
end;

procedure ordenarVector(var v: vector);
var
i,j,p: integer;  // p es pos
item: integer;
begin
	for i:= 1 to 30-1 do begin
		p:= i;
		for j:= (i+1) to 30 do
			if(v[j] < v[p])then p:= j;
	
		item:= v[p];
		v[p]:= v[i];
		v[i]:= item;
	end;
end;

Procedure busquedaDicotomica(v: vector; ini,fin: integer; dato:integer; var pos: integer);
var
medio: integer;
begin
	medio := (ini + fin ) DIV 2;
	While(ini <= fin)and(dato <> v[medio])do begin
		if(dato < v[medio])then 
			fin:= medio - 1
		else
			ini:= medio + 1;
		medio:= (ini + fin) DIV 2;
	end;
	if(ini <= fin)and(dato = v[medio])then
		pos:= medio
	else
		pos:= -1;
end;


var
v: vector;
dimL: integer;
dato: integer;
ini, fin: integer;
pos: integer;

BEGIN
dimL:= 1;
cargarVectorRecursivo(v,dimL);	
imprimirVector(v);
writeln('------------------------------- AHORA ORDENADO POR VALOR');
ordenarVector(v);
imprimirVector(v);

writeln('Ingrese entre que 2 posiciones se va a realizar la busqueda');
readln(ini);
readln(fin);

writeln('Ingrese el valor que quiera buscar');
readln(dato);
busquedaDicotomica(v,ini,fin,dato,pos);

if(pos <> -1)then
	writeln('Se encontro el valor en la posicion: ',pos)
else
	writeln('El valor NO se encuentra en el vector');
END.

