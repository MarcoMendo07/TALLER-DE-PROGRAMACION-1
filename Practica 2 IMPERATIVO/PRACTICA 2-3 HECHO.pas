{3.- Escribir un programa que invoque a los siguientes módulos e informe el resultado:

a. Un módulo recursivo que retorne un vector de a lo sumo 20 caracteres que conformen una
palabra. La lectura de los caracteres termina en ‘.’ HECHO

b. Un módulo recursivo que reciba la “palabra” generada en a) y determine si dicha palabra es
un palíndromo, es decir, si puede leerse de la misma manera de izquierda a derecha que de
derecha a izquierda. Este módulo debe retornar el valor booleano correspondiente. HECHO }


program practica2_3;

const

dimF = 20;

type

vector = array[1..dimF] of char;

procedure cargarVectorRecursivo(var v: vector; pos: integer; var dimL: integer);
begin
	if(pos <= dimF)then begin
		writeln('Ingrese un caracter');
		readln(v[pos]);
		if(v[pos] <> '.')then begin
			dimL:= dimL + 1;
			cargarVectorRecursivo(v,pos+1,dimL);
		end;	
	end;                                                 // no hay un else porq es un procedimiento de carga
end;

procedure imprimirPalabra(v: vector; dimL: integer);
var
i: integer;
begin
	for i:= 1 to dimL do
		writeln(v[i]);
end;

function Palindromo(v: vector; dimL: integer; pos:integer): boolean;
var
aux: boolean;
begin
	if(pos <= dimL)then begin
		aux:= Palindromo(v, dimL-1, pos+1);
		
		{if(aux)then writeln('true')
		else writeln('false');}
		
		if(v[pos] = v[dimL])and(aux)then
			Palindromo:= true
		else
			Palindromo:= false;   // si en alguna letra no coincide dara falso
	end
	else
		Palindromo:= true;
end;

var
v: vector;
dimL: integer;
esPalindromo: boolean;
pos: integer;

BEGIN
dimL:= 0;
cargarVectorRecursivo(v,1,dimL);

imprimirPalabra(v,dimL);	  // solo para ver

writeln;
writeln;

writeln('dimL vale: ',dimL); 
pos:= 1;
esPalindromo:= Palindromo(v,dimL,pos);
if(esPalindromo)then
	writeln('Es un Palindromo')
else
    writeln('No es un Palindromo');	
END.

