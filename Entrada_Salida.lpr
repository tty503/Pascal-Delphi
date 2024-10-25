program Entrada_Salida;

var nombre: string;
var edad: byte;

var l1: char;
var l2: char;
var l3: char;
var l4: char;

var perimetro  : real;
var lado, area : integer;
  // Con el tipo real obtenemos resultados en notacion cientifica:
  // 7.50000000000000+0000 = 7.5x10^0 = 7.5
  // 1.30000000000000+0001 = 1.3x10^1 = 13
 //var lado, area, perimetro: real;

 // La constante no requiere definir el tipo de dato, el compilador lo asigna automaticamente.
const PI = 3.14;

  // PARA DIVISIONES ENTERAS :
  // cantidadManzanas DIV cantidadPersonas; // Devuelve resultado
  // cantidadManzanas MOD cantidadPersonas; // Devuelve resto
begin
  Writeln('Hola mundo');
  Write('Hol');
  Write('a');
  Writeln('');

  Write('Escribe tu nombre: ');
  Readln(nombre);
  Writeln('Hola, '+nombre);

  Write('Ingresa tu edad: ');
  Readln(edad);
  Writeln('Tu edad es: ',edad);
  //Write(edad);

  Write('Ingrese la medida del lado: ');
  Readln(lado);
    // Asignacion de variables
  perimetro := lado * 4;
  area := lado*lado;
                              // Podemos delimitar la cantidad de digiitos del lado izquierdo y derecho de la coma.
  Writeln('El perimetro es ', perimetro:4:2);
  Writeln('El area es ', area);

  Write('Secuencia de letras (max 4): ');
  Read(l1, l2, l3, l4);
  Readln;      // Es importante tener el caracter de fin de linea
  Writeln(l4+l3+l2+l1);
                       // #13#10 es salto de linea, no sirve en Read.
  Write(l1+#13#10+l2+#13#10+l3+#13#10+l4);
  Readln;
end.

