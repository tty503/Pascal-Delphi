program ArregloDinamico_Bidimensional;

type
  bidimensional = array[1..5,1..3] of byte;

var palabra: array of char;
var dim: integer;
var i: integer;
                 // 5x3, el primero la cantidad de filas y luego la cantidad de columnas.
var matriz: bidimensional;
var fila, columna: byte;

begin
  Write('Indicar size: ');
  readln(dim);
  SetLength(palabra, dim);
                     // Los dinamicos se enumeran desde 0 hasta el maximo-1
  Writeln('El indice menor es ', Low(palabra));
  Writeln('El indice mayor es ', High(palabra));
                     // El compilador toma en cuenta lo anterior, por lo que permite
                     // utilizar iteraciones for desde 1 hasta 5.
                     // Lo correcto es usar Low y High para estructurar iteradores en arreglos dinamicos.

  // Asignar valores aleatorios
  randomize;
  for fila:=1 to 5 do begin
    for columna:=1 to 3 do begin
                   // Valor aleatorio del 0 al 9
        matriz[fila,columna]:=random(10);
    end;
  end;

  for fila:=1 to 5 do begin
    for columna:=1 to 3 do begin
        write(matriz[fila,columna], ' ');
    end;
  end;
  writeln;
  readln;
end.

