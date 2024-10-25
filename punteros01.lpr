program punteros01;

type TPersona = record
     nombre, apellido : String;
     edad : byte;
     end;

type PersonaDinamia = ^TPersona;

        // Puntero a Registro (De forma anonima)
var punteroPersona : ^TPersona;

begin
     //
  NEW(punteroPersona);
  punteroPersona^.apellido:='Apellido';
  DISPOSE(punteroPersona);
end.

