{Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
septiembre de 2025. De cada película se conoce: código de película, código de género
(1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8:
terror) y puntaje promedio otorgado por las críticas. Implementar un programa que
invoque a módulos para cada uno de los siguientes puntos:

a. Lea los datos de películas, almacenarlos por orden de llegada y agrupados por    (AGRUPADOS seria que tenga muchos elementos y cada lugar tenga todos los elem. de ese grupo)
código de género, y retornar en una estructura de datos adecuada. La lectura
finaliza cuando se lee el código de la película -1.

b. Genere y retorne en un vector, para cada género, el código de película con
mayor puntaje obtenido entre todas las críticas, a partir de la estructura
generada en a).

c. Ordene los elementos del vector generado en b) por puntaje utilizando el
método visto en la teoría.

d. Muestre el código de película con mayor puntaje y el código de película con
menor puntaje, del vector obtenido en el punto c)}


program practica1_3;

type

rangoGeneros = 1..8;

pelicula = record
codigo: integer;
genero: rangoGeneros;
puntaje: real;
end;

lista = ^nodo;
nodo = record
dato: pelicula;
sig: lista;
end;


vector = array[rangoGeneros] of lista;     // vector de LISTAS, tendra separadas las peliculas en listas por generos

vectorContador = array[rangoGeneros] of pelicula;   //es para los codigos maximos inciso b

procedure leerPelicula(var p: pelicula);
begin
	writeln('ingrese un codigo de pelicula');
	readln(p.codigo);
	if(p.codigo <> -1)then begin
		writeln('ingrese un genero de pelicula');
		readln(p.genero);
		writeln('ingrese un puntaje');
		readln(p.puntaje);
	end;
end;

procedure agregarAtras(var l, ult: lista; p: pelicula);  // se almacenan en el orden que aparecen. ult DEBE SER UN PUNTERO sino no tiene sentido el modulo
var
nue: lista;
begin
 new (nue); 
 nue^.dato := p;
 nue^.sig := nil; 
 if( l = nil) then 
	l:= nue 
 else 
	ult^.sig := nue; 
	ult := nue; 
end;

procedure inicializar(var v: vector);
var
i: rangoGeneros;
begin
	for i:= 1 to 8 do
		v[i]:= nil;
end;

procedure cargarDatos(var v: vector);
var
p: pelicula;
ult: vector;          

begin	
	inicializar(v);    // le pone nil a cada lista del vec
	inicializar(ult);
	leerPelicula(p);
	while(p.codigo <> -1)do begin
	agregarAtras(v[p.genero], ult[p.genero], p);    // le paso la lista del genero de la pelicula que leo  !!atencion aca	 
	leerPelicula(p);
	end;
end;

procedure inicializarContador(var v: vectorContador);
var
i: rangoGeneros;
begin
	for i:= 1 to 8 do begin
		v[i].codigo:= 0;
		v[i].genero:= 1;   // no lo voy a usar
		v[i].puntaje:= 0;
	end;	
end;

procedure valoresMaximos(l: lista; var max: real; var codMax: integer; var cantidadGenerosLeidos:integer);       // RE PIOLA ESTA FUNCION (antes habia una funcion xd)}
begin
	if (l <> nil) then cantidadGenerosLeidos:= cantidadGenerosLeidos + 1;
	while(l <> nil)do begin
		if(l^.dato.puntaje > max)then begin
			max:= l^.dato.puntaje;
			codMax:= l^.dato.codigo;
		end;
		l:= l^.sig;
	end;
end;	

procedure obtenerMaximos(peliculas: vector; var vectorMaximos: vectorContador; var cantidadGenerosLeidos:integer);	// recorrer el vector, para cada lissta obtener el cod max y guardarlo en el v contador
var
i: rangoGeneros;
max: real;
codMax: integer;

begin
	for i:= 1 to 8 do begin
		max:= -1;
		codMax:= -1;
		valoresMaximos(peliculas[i],max,codMax, cantidadGenerosLeidos);  // antes lo resolvia con una funcion pero lo tuve q cambiar a un procedure para que devuelva tambien el puntaje
	   	if(max <> -1)then begin  
	   	  vectorMaximos[i].codigo:= codMax;        
		  vectorMaximos[i].puntaje:= max;
		end;  
	end;
end;

procedure incisoC(var v: vectorContador; dimL: integer);   // MODIFICAR ACA    (TENGO Q modificar el vector contador para que ahora ademas de guardar el codigo maximo me guarde el puntaje de esa pelicula
var
i,j,pos: integer;
item: pelicula;    // porque el vec contador tiene peliculas (una de cada genero)
begin
	for i:= 1 to (8-1) do begin
		pos:= i;
		for j:= (i+1) to 8 do
			if(v[j].puntaje < v[pos].puntaje)then  pos:= j;
	    item:= v[pos];
	    v[pos]:= v[i];
	    v[i]:= item;	
	end;    
end;

procedure incisoD(v: vectorContador; dimL: integer);
var
	i:integer;
begin
	if(dimL <> 0)then begin
		writeln('Codigo de pelicula con mayor puntaje: ',v[8].codigo,' --- Puntaje: ',v[8].puntaje:2:2);
		writeln('Codigo de pelicula con menor puntaje: ',v[8-dimL+1].codigo,' --- Puntaje: ',v[8-dimL+1].puntaje:2:2);
		writeln('generos leidos: ',dimL);
		
		writeln('----------------------------');
		writeln('Para ver como quedo el vector:');
		for i:=1 to 8 do
		  writeln('Codigo de pelicula con mayor puntaje: ',v[i].codigo,' --- Puntaje: ',v[i].puntaje:2:2);
	end
	else
			writeln('No se leyo ninguna pelicula');
end;


var
peliculas: vector;
vectorMaximos: vectorContador;  // para los maximos

cantidadGenerosLeidos: integer;                 
BEGIN

cargarDatos(peliculas);	
inicializarContador(vectorMaximos);

cantidadGenerosLeidos:=0;

obtenerMaximos(peliculas,vectorMaximos,cantidadGenerosLeidos);	 // esto es b

incisoC(vectorMaximos, cantidadGenerosLeidos);   
             
incisoD(vectorMaximos, cantidadGenerosLeidos);

END.

