program Funciones;
        // Enumerados
type TDias = (DOMINGO, LUNES, MARTES, MIERCOLES, JUEVES, VIERNES, SABADO);
var  d : TDias;

function sumar(valor1, valor2 : integer) : integer;
                      // En pascal no existe nativamente, no finaliza la funcion
                      var return : integer;
         begin
                      // estas son variables locales, las que estan en program son globales
              return := valor1 + valor2;
         end;
         // Pascal admite la sobrecarga
function sumar(valor1, valor2 : real) : real;
                      var return : real;
         begin
              return := valor1 + valor2;
         end;
begin
         // Si paso directamente la variable, se hace por referencia
         // Para pasar por valor, hay que hacer copias de las variables
  writeln(sumar(2, 4));
  d:= TDias.LUNES;
  writeln(d);
  readln();
end.

