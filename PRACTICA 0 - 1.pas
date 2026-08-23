

program practica0_1;

procedure incD;
var
i: integer;
ale: integer;
begin
for i:= 1 to 20 do begin
 ale:= random(100);
 writeln('el numero aleatorio generado es: ',ale,'    - i=', i);
end; 
end;

procedure incE(n, a, b: integer);
var
i: integer;
ale: integer;
begin
for i:= 1 to n do begin
 ale:= random(b-a + 1) + a;    // el + 1 es oara que incluya el límite sup. (se le suma el valor "a" al final, es una constante)
 writeln('el numero aleatorio generado es: ',ale,'    - i=', i);
 end;
end;

procedure incF(f, a, b: integer);
var
ale: integer;
begin
	ale := random(b-a + 1) + a;   // le pone un valor aleatorio a ale
	while(ale <> f) do begin
		writeln('el numero aleatorio generado es: ',ale); 
		ale := random(b-a) + a;   // se le asigna un nuevo valor aleatorio a ale
	end;
end;

var
a,b,n: integer;
begin
randomize;
readln(n);
readln(a);
readln(b);
//incD;
//incE(n,a,b); 
incF(n,a,b);
END.

