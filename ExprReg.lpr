program ExprReg;
uses RegExpr;

// Declaracion de variables
  var rExp : TRegExpr;
  var expresion, cadena : string;

// Recursividad
function factorial(n: integer): integer;
begin
     if n = 0 then
        factorial := 1
     else
        factorial := n * factorial(n - 1);
        write(n, ', ');
end;


// Bloque principal
begin
  expresion := '(K|(KA))_[0-9A-Ja-j]{5,9}';
  cadena    := 'K_0jddasdKA_aaaaa';

  // Inicializar el objeto
  rExp := TRegExpr.Create(expresion);

  // Con la operacion Exec que recibe la cadena a evaluar. Es Booleana.
  if rExp.Exec(cadena) then begin
    // Con match obtenemos el fragmento que coincide con la expresion regular.
    writeln(rExp.Match[0]);
  end;
  // Liberamos la memoria.
  rExp.Free;

            // Visualizar el CALL STACK
  factorial(10);
  readln;
end.

