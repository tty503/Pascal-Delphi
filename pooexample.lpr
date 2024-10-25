program GestionCuentasBancarias;

type

{ TCuentaBancaria }

TCuentaBancaria = class
  private
    numeroCuenta: string;
    titular: string;
    saldo: real;
  public
    constructor Crear(pNumeroCuenta: string; pTitular: string);
    procedure Depositar(monto: real);
    procedure Retirar(monto: real);
    function ConsultarSaldo(): real;
  end;

{ Implementación de métodos de la clase TCuentaBancaria }

constructor TCuentaBancaria.Crear(pNumeroCuenta: string; pTitular: string);
begin
  numeroCuenta := pNumeroCuenta;
  titular := pTitular;
  saldo := 0.0;
end;

procedure TCuentaBancaria.Depositar(monto: real);
begin
  if monto > 0 then
    saldo := saldo + monto;
  //else
  //  WriteLn('Error: El monto a depositar debe ser positivo.');
end;

procedure TCuentaBancaria.Retirar(monto: real);
begin
  if (monto > 0) AND (saldo >= monto) then
      saldo := saldo - monto
  else
      WriteLn('Error: El monto a retirar es inválido.');
end;

function TCuentaBancaria.ConsultarSaldo(): real;
begin
     Saldo := saldo;
end;

{ Ejemplo de uso de la clase TCuentaBancaria }

var
  miCuenta: TCuentaBancaria;

var Saldo: real;
begin
  miCuenta := TCuentaBancaria.Crear('123456789', 'Juan Pérez');

  WriteLn('Número de cuenta:', miCuenta.numeroCuenta);
  WriteLn('Titular:', miCuenta.titular);
  WriteLn('Saldo actual:', miCuenta.ConsultarSaldo());

  miCuenta.Depositar(1000.0);
  WriteLn('Saldo después del depósito:', miCuenta.ConsultarSaldo());

  miCuenta.Retirar(500.0);
  WriteLn('Saldo después del retiro:', miCuenta.ConsultarSaldo());

  readln;
end.


