program Procedimientos;

procedure imprimirAsteriscos_horizontal();
          var i: byte;
  begin
       for i:=1 to 45 do begin
         write('*');
       end;
  end;
procedure imprimirAsteriscos_vertical();
          var i: byte;
  begin
       for i:=1 to 22 do begin
         writeln('*');
       end;
  end;
procedure imprimirAsteriscos(filas: integer; columnas: integer);
var i, j: integer;
begin
  for i := 1 to filas do
  begin
    for j := 1 to columnas do
      write('*');
    writeln;
  end;
end;

begin
     //imprimirAsteriscos_horizontal();
     //imprimirAsteriscos_vertical();
     //imprimirAsteriscos_horizontal();
     //imprimirAsteriscos(4, 4);
     readln;
end.

