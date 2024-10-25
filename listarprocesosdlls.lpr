unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls, Variants, ComObj, ActiveX;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ListView1: TListView;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
const
  wbemFlagForwardOnly = $00000020;
var
  FSWbemLocator : OLEVariant;
  FWMIService   : OLEVariant;
  FWbemObjectSet: OLEVariant;
  FWbemObject   : OLEVariant;
  oEnum         : IEnumVariant;
  iValue        : LongWord;
begin
  CoInitialize(nil);
  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  FWMIService := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '');
  FWbemObjectSet:= FWMIService.ExecQuery('SELECT ExecutablePath, name, ProcessId FROM Win32_Process','WQL',wbemFlagForwardOnly);
  oEnum := IUnknown(FWbemObjectSet._NewEnum) as IEnumVariant;
  while oEnum.Next(1, FWbemObject, iValue) = 0 do
  begin
    if not VarIsNull(FWbemObject.ExecutablePath) then
    begin
      //Writeln(string(FWbemObject.ProcessId) + ': ' + string(FWbemObject.ExecutablePath));   // original
      with Form1.ListView1.Items.Add do
        begin
        Caption:= FWbemObject.name;
        SubItems.Add(FWbemObject.ProcessId);
        SubItems.Add(FWbemObject.ExecutablePath);
        end;

    end;

    FWbemObject:=Unassigned; //avoid memory leak in oEnum.Next
  end;

end;

end.
