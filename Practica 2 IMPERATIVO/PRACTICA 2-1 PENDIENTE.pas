{1.- Implementar un programa que invoque a los siguientes modulos.

a. Un modulo recursivo que retorne un vector de a lo sumo 15 numeros enteros (random) mayores a 130 y menores a 145 (incluidos ambos).
La carga finaliza con el valor 130.  YA VIENE HECHO

b. Un modulo no recursivo que reciba el vector generado en a) e imprima el contenido del vector. YA VIENE HECHO

c. Un modulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.  HECHO

d. Un modulo recursivo que reciba el vector generado en a) y devuelva la suma de los valores contenidos en el vector.  HECHO

e. Un modulo recursivo que reciba el vector generado en a) y devuelva el maximo valor del vector.

f. Un modulo recursivo que reciba el vector generado en a) y un valor y devuelva verdadero si dicho valor se encuentra en el vector
   o falso en caso contrario.

g. Un modulo que reciba el vector generado en a) e imprima, para cada numero contenido en el vector, sus digitos en el orden en
   que aparecen en el numero. 
   Debe implementarse un modulo recursivo que reciba el numero e imprima lo pedido.
   Ejemplo si se recibe el valor 134, se debe imprimir 1  3  4
}

//COMPLETAR EL CODIGO

Program Clase2MI;
const dimF = 15;
      min = 130;
      max = 145;
      
type vector = array [1..dimF] of integer;
     


procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
var
valor: integer;
begin
    valor:= min + random (max - min + 1);    //valor guarda un numero random entre 130 y 145
    if ((valor <> 130 ) and (dimL < dimF))   // 2 casos base
    then begin
          dimL:= dimL + 1;
          v[dimL]:= valor;
          CargarVectorRecursivo (v, dimL);  // este modulo esta bien en teoria, seria el inciso a. cuando se
         end;                               // terminan todas las instancias simplemente vuelve al prog. ppal.
end;
 
procedure CargarVector (var v: vector; var dimL: integer);
begin
  dimL:= 0;                         // dimL debe estar en 0
  CargarVectorRecursivo (v, dimL);  // supongo q va aca
end;

 
procedure ImprimirVector (v: vector; dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do
         write ('------');
     writeln;                   // los writeln son para dejar espacios vacios entre lineas
     write (' ');
     for i:= 1 to dimL do begin
        write(v[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('------');
     writeln;
     writeln;
End;     

procedure ImprimirLineas(v:vector; dimL:integer; pos: integer);
begin
    if(pos <= dimL)then begin	
		write ('------');
		ImprimirLineas(v,dimL, pos+1);
	end;
end;

procedure ImprimirVectorRecursivo (v: vector; dimL: integer; pos: integer);   //esta bueno usar pos para q lo imprima en orden
begin
	if(pos <= dimL)then begin	
		write(v[pos], ' | ');
		ImprimirVectorRecursivo(v,dimL, pos+1);
	end;
end; 

function SumarRecursivo (v: vector; pos, dimL: integer): integer;
Begin
    if (pos <= dimL) then 
		SumarRecursivo:= SumarRecursivo (v, pos + 1, dimL) + v[pos]           //se va ejecutando multiples veces; LLEGA al final y luego le va
    else                                                                                                 //sumando 0 + elemento anterior,  + elemento anterior +...
		SumarRecursivo:=0  // RECIBE 0 cuando se termina dimL, es decir cuando no hay mas elementos
End;
 
function Sumar (v: vector; dimL: integer): integer;  // SEGUIR ACA, inciso d
var
pos: integer; 
begin
 pos:= 1;
 Sumar:= SumarRecursivo (v, pos, dimL);
end;

function  ObtenerMaximo (v: vector; dimL: integer): integer;
var 
maxAux: integer;
begin	
  if(dimL <> 0)then begin
	maxAux := ObtenerMaximo(v, dimL-1);
	if (v[dimL] > maxAux)then
		ObtenerMaximo:= v[dimL]
	else
		ObtenerMaximo:= maxAux
  end		
  else
	ObtenerMaximo:= 0	
end;     
     
function  BuscarValor (v: vector; dimL, valor: integer): boolean;
var
encontre: boolean;
begin
  if(dimL <> 0)then begin
	encontre:= BuscarValor(v, dimL-1, valor);
    if(v[dimL] = valor)and(encontre = false)then begin
		BuscarValor:= true;
		writeln('se encontro el valor');
	end
	else
		BuscarValor:= encontre;            // la funcion siempre debe devolver algo
  end
  else
    BuscarValor:= false; // pone en falso cuando dimL vale 0
        
end; 

procedure ImprimirDigitos (v: vector; dimL: integer);    // tengo que usar mod 10 repetidas veces(seguro)
begin                                                    //OSEA imprimir 1ro el numero con mod 3 veces, dsp 2 veces y por ultimo 1 vez
		                                                  // primero hacerle div 10 para achicar el numero  o no se
end; 

var
dimL, suma, maximo, valor: integer; 
v: vector;
encontre: boolean;

Begin 
  randomize;
  CargarVector (v, dimL);      //empezar aca
  writeln;
  if (dimL = 0) then writeln ('--- Vector sin elementos ---')
                else begin
                       ImprimirVector (v, dimL); 
                       
                       writeln('dimL vale: ',dimL);
                       ImprimirLineas(v,dimL, 1);
                       writeln;
                       write(' ');
                       ImprimirVectorRecursivo (v, dimL, 1);  // 1 es la pos
                       writeln;
                       ImprimirLineas(v,dimL, 1);
                     end;
  writeln;
  writeln;                   
  suma:= Sumar(v, dimL);    // la funcion SUMAR llama a la funcion sumarRecursivo
  writeln;
  writeln;
  writeln('La suma de los valores del vector es ', suma); 
  writeln;
  writeln;
  maximo:= ObtenerMaximo(v, dimL);
  writeln;
  writeln;
  writeln('El maximo del vector es ', maximo); 
  writeln;
  writeln;
  write ('Ingrese un valor a buscar: ');
  read (valor);
  encontre:= BuscarValor(v, dimL, valor);
  writeln;
  writeln;
  if (encontre) then writeln('El ', valor, ' esta en el vector')
                else writeln('El ', valor, ' no esta en el vector');
                
  writeln;
  writeln;
  ImprimirDigitos (v, dimL);
end.
