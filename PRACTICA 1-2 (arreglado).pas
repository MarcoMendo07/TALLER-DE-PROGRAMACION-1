// El administrador de un edificio de oficinas cuenta, en papel, con la información del
//pago de las expensas de dichas oficinas. Implementar un programa que invoque a
//módulos para cada uno de los siguientes puntos:

//a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De
//cada oficina se ingresa el código de identificación, DNI del propietario y valor
//de la expensa. La lectura finaliza cuando se ingresa el código de identificación
//-1, el cual no se procesa.

//b. Ordene el vector aplicando el método de selección, por código de
//identificación de la oficina.

program practica1_2;

const
dimF = 300;

type

oficina = record
codigo: integer;
dni: integer;
valor: real;
end;

vectorOficinas = array[1..dimF] of oficina;

procedure leerOficina(var o: oficina);
begin
	writeln('Ingrese un DNI');
	readln(o.dni);
	writeln('Ingrese un valor de expensa');
	readln(o.valor);
end;

procedure cargarVector(var vOficinas: vectorOficinas; var dimL: integer);
var
o: oficina;
begin
	dimL:= 0;
	writeln('Ingrese un codigo');
    readln(o.codigo);
	while(o.codigo <> -1)do begin
	 dimL:= dimL + 1;
	 leerOficina(o);
	 vOficinas[dimL]:= o;
	 writeln('Ingrese un codigo');
	 readln(o.codigo);
	end;
end;

procedure ordenarVector(var vOficinas: vectorOficinas; dimL: integer);
var
i, j, pos: integer;
item: oficina;
begin
	for i:= 1 to (dimL-1) do begin
	 pos:= i;
	 for j:= (i+1) to dimL do
		if(vOficinas[j].codigo < vOficinas[pos].codigo) then pos:= j;
	 
	 item:= vOficinas[pos];
	 vOficinas[pos]:= vOficinas[i];
	 vOficinas[i]:= item;	
	end;
end;

procedure imprimirVector(vOficinas: vectorOficinas ; dimL:integer);
var
i: integer;
begin
	for i:= 1 to dimL do begin
		writeln('------------');
		writeln('codigo: ',vOficinas[i].codigo);
		writeln('DNI: ',vOficinas[i].dni);
		writeln('valor: ',vOficinas[i].valor:2:2);    // :2:2 Es para bloquear el numero de decimales
	end;
end;

var
vOficinas: vectorOficinas;
dimL: integer;

BEGIN
cargarVector(vOficinas,dimL);
ordenarVector(vOficinas,dimL);	

imprimirVector(vOficinas,dimL);
END.

