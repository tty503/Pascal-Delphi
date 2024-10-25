        // Declaramos la unidad / Modulo.
unit Operaciones;
        // La parte visible del modulo. Es lo que se puede acceder desde fuera.
        // En interfaces van solo los encabezados (la declaracion).
interface
         type ListaNumeros = ^NodoLista;
              NodoLista    = record
                           n: integer;
                           siguiente: ListaNumeros;
              end;

         function crearLista(largo: integer) : ListaNumeros;
         function borrarPrimeraOcurrencia(numero: integer; var l: ListaNumeros) : boolean;
         function borrarUltimaOcurrencia(numero: integer; var l: ListaNumeros) : boolean;
         function contarOcurrencias(numero: integer; const l: ListaNumeros) : integer;

         procedure borrarOcurrencias(numero: integer; soloRepetidos: boolean; dejarPrimera: boolean; var l: ListaNumeros);
         procedure impimirLista(const l: ListaNumeros);
         procedure borrarLista(var l: ListaNumeros);

        // Aqui implementamos todo lo que hemos declarado en Interface.
        // Tambien podemos tener procedimientos, funciones, variables privados.
implementation

        function crearLista(largo: integer): ListaNumeros;
        begin

        end;

        function borrarPrimeraOcurrencia(numero: integer; var l: ListaNumeros): boolean;
        begin

        end;

        function borrarUltimaOcurrencia(numero: integer; var l: ListaNumeros): boolean;
        begin

        end;

        function contarOcurrencias(numero: integer; const l: ListaNumeros): integer;
        begin

        end;

        procedure borrarOcurrencias(numero: integer; soloRepetidos: boolean;
          dejarPrimera: boolean; var l: ListaNumeros);
        begin

        end;

        procedure impimirLista(const l: ListaNumeros);
        begin

        end;

        procedure borrarLista(var l: ListaNumeros);
        begin

        end;

end.

