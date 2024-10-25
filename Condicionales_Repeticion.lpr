program Condicionales_Repeticion;

var edad : integer;
var opcion : char;
var op : byte;

//var cod : boolean;
  // AND, OR, XOR
begin
  write('ingresa edad: ');
  readln(edad);

  // Version simple
  //if edad < 40 then
  //   writeln('Eres muy joven');
  //else
  //   writeln('Eres veterano');

  // Version extendida
  if edad < 40 then begin
     writeln('Eres muy joven');
  end else if edad = 40 then begin
      writeln('Eres cuarenton');
  end else if edad <> 0 then begin
      writeln('No puede ser cero');
  end else begin
      writeln('Eres veterano');
  end;

  Writeln('==============');
  Writeln('1. Saludar');
  Writeln('2. Despedir');
  write(':');
  read(opcion);
  case opcion of
       '1' : begin
             writeln('Hola');
             readln;
       end;
       '2' : begin
             writeln('Bye');
             readln;
       end;
  end;
  read(op);
  case op of
       1: writeln('Como va ser'); readln;
       2: writeln('Esto o aquello'); readln;
       3,4,5: writeln('Lo mismo para varios valores'); readln;
  else
      writeln('ERROR - fuera de rango');  readln;
  end;
  // NOTA, raro que con el case no pase por esta instruccion.
  readln;
end.

