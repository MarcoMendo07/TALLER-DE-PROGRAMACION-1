{Implementar un programa que invoque a los siguientes módulos y  compruebe el correcto funcionamiento del mismo.

a. Implementar un módulo que lea información de las ventas realizadas y almacene los productos vendidos en una estructura de datos eficiente para la 
búsqueda por código de producto.
De cada producto deben almacenarse su código, la cantidad total de unidades vendidas y el monto total de ventas.

De cada venta se ingresa: código de venta, código del producto vendido, cantidad de unidades vendidas y precio unitario.  // es una sola venta
La lectura de las ventas finaliza cuando se ingresa el código de venta 0.

b. Imprimir el contenido del árbol ordenado por código de producto.

c. Retornar el menor código de producto.

d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor que se recibe como parámetro.

e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos valores recibidos (sin incluir) como parámetros. HECHO (todo)

}

Program ImperativoClase4;

type venta = record                            // tipo venta
               codigoVenta: integer;
               codigoProducto: integer;
               cantUnidades: integer;
               precioUnitario: real;
             end;
     productoVendido = record                 // tipo productoVendido
                         codigo: integer;
                         cantTotalUnidades: integer;
                         montoTotal: real;
                       end;
     arbol = ^nodoArbol;                        // arbol de productos
     nodoArbol = record
                    dato: productoVendido;
                    HI: arbol;
                    HD: arbol;
                 end;

// MODULO A
     
Procedure CargarVenta (var v: venta);
begin
  v.codigoVenta:= random (51) * 100;  // una banda de codigos de venta
  If (v.codigoVenta <> 0)
  then begin
         v.codigoProducto:= random (100) + 1;
         v.cantUnidades:= random(15) + 1;
         v.precioUnitario:= (100 + random (100))/2;
       end;
end;  
  
Procedure ArmarProducto (var p: productoVendido; v: venta);
begin
   p.codigo:= v.codigoProducto;                   // le pasa los campos de las ventas al producto
   p.cantTotalUnidades:= v.cantUnidades;
   p.montoTotal:= v.cantUnidades * v.precioUnitario; // ojo aca
end;

Procedure InsertarElemento (var a: arbol; elem: venta);
var
p: productoVendido;  // tipo producto
Begin
    if (a = nil)                 {RECORDAR QUE: esta primera parte es para cuando el arbol tiene que insertar un nodo nuevo}
    then begin
           new(a);
           ArmarProducto (p, elem);
           a^.dato:= p;   // le pasa el producto armado con todos los datos
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else if (elem.codigoProducto = a^.dato.codigo)   // ELEM, o la VENTA, es el elemento que ENTRA, lo que hay en a^.dato es el ELEMENTO PREVIO
         then begin
                a^.dato.cantTotalUnidades:= a^.dato.cantTotalUnidades + elem.cantUnidades;        // si el ELEM nuevo que entra es del mismo codigo q el anterior, le suma al total de unidades vendidas
                a^.dato.montoTotal:= a^.dato.montoTotal + (elem.cantUnidades * elem.precioUnitario);  // lo mismo para el monto total ingresado por ese cod de producto
              end
         else if (elem.codigoProducto < a^.dato.codigo)  // si es menor inserta en el HI, si es IGUAL o mayor en el HD
              then InsertarElemento(a^.HI, elem)
              else InsertarElemento(a^.HD, elem); 
End;

procedure ModuloA (var a: arbol);
var
unaVenta: venta;  
Begin
 writeln;
 writeln ('----- Ingreso de ventas y armado de arbol de productos ----->');
 writeln;
 a:= nil;
 CargarVenta (unaVenta);
 while (unaVenta.codigoVenta <> 0) do
  begin
   InsertarElemento (a, unaVenta);
   CargarVenta (unaVenta);
  end;
 writeln;
 writeln ('-----------------------------------------------');
 writeln;
end;

// MODULO B

procedure ImprimirArbol (a: arbol);        // NUEVA FORMA PARA IMPRIMIR. igual hace lo mismo que el proc. enOrden pero un poquito mas completo
begin
    if (a <> nil)
    then begin
          if (a^.HI <> nil) then ImprimirArbol (a^.HI);
          writeln ('Codigo producto: ', a^.dato.codigo, ' cantidad unidades: ', a^.dato.cantTotalUnidades, ' monto total: ', a^.dato.montoTotal:2:2);
          if (a^.HD <> nil) then ImprimirArbol (a^.HD);
         end;
end;

procedure ModuloB (a: arbol);
begin
  writeln;
  writeln ('----- Modulo B ----->');
  writeln;
  if ( a = nil) then writeln ('Arbol vacio') 
                else ImprimirArbol (a);
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

// MODULO C

function ObtenerMinimo (a: arbol): integer;       // se puede usar una variable min. inicializada antes, y es mas comodo. pero no es necesario.
begin
    if (a = nil) 
    then ObtenerMinimo:= 9999
    else if (a^.HI = nil) then ObtenerMinimo:= a^.dato.codigo           // analiza solo por el HI, porque busca el minimo
                          else ObtenerMinimo:= ObtenerMinimo (a^.HI)    // si es nil, el dato es ese, el acutal. sino es el HI del actual.
end;

procedure ModuloC (a: arbol);   // todos reciben solamente el arbol
var
menorCodigo: integer;
begin
  writeln;
  writeln ('----- Modulo C ----->');
  writeln;
  write ('Menor codigo de producto: ');
  writeln;
  menorCodigo:= ObtenerMinimo (a);
  if (menorCodigo = 9999) 
  then writeln ('Arbol vacio')  // contempla arbol vacio
  else begin
         writeln;
         writeln ('El codigo menor es ', menorCodigo); 
         writeln;
       end;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

// MODULO D
  
// d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor que se recibe como parámetro.  
  
function CantidadDeCodigosMenores (a: arbol; cod: integer): integer;  // devuelve la cant de codigos menores
begin
	if(a = nil)then CantidadDeCodigosMenores:= 0   
    else begin                                         // si no entra nunca el if es que no habia codigos menores?
		if(a^.dato.codigo < cod)then                   // si el codigo del arbol es menor suma 1 y sigue llamando recursivamente, cuando llega a nil suma 0 asi q no modifica
			CantidadDeCodigosMenores:= 1 + CantidadDeCodigosMenores(a^.HI, cod) + CantidadDeCodigosMenores(a^.HD, cod)
		else begin
			CantidadDeCodigosMenores:= CantidadDeCodigosMenores(a^.HI, cod);       // LA FUNCION SIEMPRE DEBE RETORNAR ALGO
		end;
    end;
end;

procedure ModuloD (a: arbol);   
var
cantidad, unCodigo: integer;
begin
  writeln;
  writeln ('----- Modulo D ----->');
  writeln;
  write ('Ingresar un codigo: ');
  readln (unCodigo);
  cantidad:= CantidadDeCodigosMenores (a, unCodigo);
  writeln;
  writeln ('La cantidad de codigos menores al codigo ', unCodigo, ' es: ', cantidad);
  writeln;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

// MODULO E

// e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos valores recibidos (sin incluir) como parámetros.

function ObtenerMontoTotalEntreDosCodigos (a: arbol; codigo1, codigo2: integer): real;    // devuelve un real, tiene q recorrer todo el arbol entre los dos codigos
begin
	if(a = nil)then ObtenerMontoTotalEntreDosCodigos:= 0     // esto esta bien se supone, es el CASO BASE
    else begin
		if(a^.dato.codigo > codigo1)and(a^.dato.codigo < codigo2)then begin     // se cumple el enunciado porque puse < y > estrictos
			ObtenerMontoTotalEntreDosCodigos:= a^.dato.montoTotal + ObtenerMontoTotalEntreDosCodigos(a^.HI, codigo1, codigo2)
			                                                      + ObtenerMontoTotalEntreDosCodigos(a^.HD, codigo1, codigo2);
		end
		else begin
			if(a^.dato.codigo >= codigo2)then
				ObtenerMontoTotalEntreDosCodigos:= ObtenerMontoTotalEntreDosCodigos(a^.HI, codigo1, codigo2)      // si se PASA del rango, probar con el HI
			else if(a^.dato.codigo <= codigo1)then	
				ObtenerMontoTotalEntreDosCodigos:= ObtenerMontoTotalEntreDosCodigos(a^.HD, codigo1, codigo2);      // si es mas CHICO que el rango, probar con el HD
		end;
	end;                      //FUNCIONA y solo suma entre los dos valores, no los incluye
end;

procedure ModuloE (a: arbol);   
var
codigo1, codigo2: integer;
montoTotal: real;
begin
  writeln;
  writeln ('----- Modulo E ----->');
  writeln;
  write ('Ingrese primer codigo de producto: ');
  readln (codigo1);
  write ('Ingrese segundo codigo de producto (mayor al primer codigo): ');
  readln (codigo2);
  writeln;
  montoTotal:= ObtenerMontoTotalEntreDosCodigos (a, codigo1, codigo2);
  if (montoTotal = 0) 
  then writeln ('No hay codigos entre ', codigo1, ' y ', codigo2)
  else begin
         writeln;
         writeln ('El monto total entre el codigo: ', codigo1, ' y el codigo: ', codigo2, ' es: ', montoTotal:2:4); 
         writeln;
       end;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

var a: arbol; 
Begin
  randomize;
  ModuloA (a);
  ModuloB (a);
  ModuloC (a);
  ModuloD (a);
  ModuloE (a);
  
End.
