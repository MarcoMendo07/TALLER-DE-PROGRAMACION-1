// Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
//septiembre de 2025. De cada película se conoce: código de película, código de género
//(1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8:
//terror) y puntaje promedio otorgado por las críticas.
//Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

//a. Lea los datos de películas, almacenarlos por orden de llegada y agrupados por
//código de género, y retornar en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la película -1. HECHO

//b. Genere y retorne en un vector, para cada género, el código de película con
//mayor puntaje obtenido entre todas las críticas, a partir de la estructura
//generada en a). HECHO

//c. Ordene los elementos del vector generado en b) por puntaje utilizando el
//método visto en la teoría. (menor a mayor entiendo)

//d. Muestre el código de película con mayor puntaje y el código de película con
//menor puntaje, del vector obtenido en el punto c)

program practica1_3;

type

RangoGeneros = 1..8;

pelicula = record
codigo: integer;
genero: RangoGeneros;
puntaje: real;
end;

listaPeliculas = ^nodo;
nodo = record
dato: pelicula;
sig: listaPeliculas;
end;

vectorGeneros = array[RangoGeneros] of pelicula;  
                                                   
procedure leerPelicula(var p: pelicula);
begin
	writeln('Ingrese un codigo de pelicula:');
	readln(p.codigo);
	if(p.codigo <> -1)then begin
		writeln('Ingrese un genero de pelicula:');
		readln(p.genero);
		writeln('Ingrese un puntaje:');
		readln(p.puntaje);
	end;	
end;

procedure insertarOrdenado(var l: listaPeliculas; p:pelicula);   // p es el dato que entra al modulo
var
ant,act,nue: listaPeliculas;
begin
	new(nue);
	nue^.dato:= p;
	ant:= l;
	act:= l;
	while(act <> nil) and (p.genero > act^.dato.genero)do begin
		ant:= act;
		act:= act^.sig;
	end;	
    if(act = ant)then
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;		

procedure cargarLista(var l: listaPeliculas);
var
p: pelicula;
begin
	writeln('Si ingresa el codigo de pelicula -1 se finalizara la lectura');
	leerPelicula(p);
	while(p.codigo <> -1)do begin
		insertarOrdenado(l,p);
		leerPelicula(p);
    end;
end;

procedure actualizarMaximo(p: pelicula; var max: real; var codMax: integer);
begin
	if(p.puntaje > max)then begin
		max:= p.puntaje;
		codMax:= p.codigo;
	end;
end;

procedure incisoB(l: listaPeliculas; var vGeneros: vectorGeneros; var dimL:integer);
var
generoAct: RangoGeneros;
max: real;
codMax: integer;
begin
	dimL:= 0;
	while(l <> nil)do begin                                    //esta ordenada por cod de genero
		max:= -1;
		codMax:= -1;
		generoAct:= l^.dato.genero;                            
		writeln('generoAct contiene el numero de genero: ',l^.dato.genero);
		while(l <> nil) and (generoAct = l^.dato.genero)do begin
			
			vGeneros[generoAct].codigo:= l^.dato.codigo;
			vGeneros[generoAct].genero:= l^.dato.genero;
			vGeneros[generoAct].puntaje:= l^.dato.puntaje;
			
			actualizarMaximo(l^.dato,max,codMax);                               
			l:= l^.sig;
		end;
		dimL:= dimL + 1;                                     // en teoria se termino de analizar un genero
		vGeneros[generoAct].codigo:= codMax;                 //le pasa el codigo de la pelicula de puntaje maximo en la posicion del genero correspondiente calculado	
		
	end;
end;

procedure imprimirVector(vGeneros: vectorGeneros);
var
i: integer;
begin
	writeln('Si un genero aparece con el codigo 0, es porque no se leyo ninguna pelicula con ese genero');
	for i:= 1 to 8 do
		writeln('Genero: ',i,' Codigo de pelicula con mayor puntaje del Genero: ',vGeneros[i].codigo);
end;

Procedure incisoC(var vGeneros: vectorGeneros; dimL: integer);
var 
i,j,pos: integer;
item: pelicula; 	
begin
 for i:= 1 to (dimL-1)do begin 
	pos := i;
    for j := (i+1) to dimL do
		if vGeneros[j].puntaje < vGeneros[pos].puntaje then pos:= j;
    item := vGeneros[pos];   
    vGeneros[pos] := vGeneros[i];   
    vGeneros[i] := item;
 end;
end;

procedure imprimirVectorOrdenado(vGeneros: vectorGeneros; dimL: integer);
var
i: integer;
begin
	writeln('Los valores deben aparecer de menor a mayor');
	for i:= 1 to 8 do
		writeln('Puntaje: ',vGeneros[i].puntaje:2:2);
end;

var
l: listaPeliculas;
vGeneros: vectorGeneros;
dimL: integer;
BEGIN
l:= nil;
cargarLista(l);	              

incisoB(l,vGeneros,dimL);
//imprimirVector(vGeneros);

incisoC(vGeneros,dimL);
imprimirVectorOrdenado(vGeneros,dimL);

END.
