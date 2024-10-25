program Arreglos;
        // Definir tipos
type
    abecedario = array[1..52] of char;
    letras = 'A'..'E';
    mayusculas = array[letras] of char;
        // 5 celdas, enumeradas del 1 al 5
var ab : array[1..5] of byte;
var miABC: mayusculas;

// iteradores
var i: byte;
var a: char;
begin
  ab[1] := 2;
  ab[2] := 4;
  ab[3] := 6;
  ab[4] := 8;
  ab[5] := 10;

  writeln(ab[1]);
  write('Ingrese 5 valores: ');
  for i:=1 to 5 do begin
      readln(ab[i]);
  end;

  write('Ingrese 5 valores: ');
  for a:='A' to 'E' do begin
      readln(miABC[a]);
  end;

  writeln;
  for i:=1 to 5 do begin
      write(ab[i]);
  end;

  writeln;
  for a:='A' to 'E' do begin
       write(miABC[a]);s
  end;

  readln;
end.

