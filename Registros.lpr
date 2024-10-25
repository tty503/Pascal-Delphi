program Registros;
type TPersona = record
     nombre, apellido: string;
     edad: byte;
end;
var p : TPersona;

begin
  write('Ingresa tu nombre: ');
  readln(p.nombre);

  write('Ingresa tu apellido: ');
  readln(p.apellido);

  write('Ingresa tu edad: ');
  readln(p.edad);
end.

