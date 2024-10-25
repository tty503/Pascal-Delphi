program listarprocesosdlls;

{$AppTarget 'Win32'}

uses
  Windows, Classes, SysUtils;

var
  ProcessList: TStringList;
  ProcessID: DWORD;
  ModuleHandle: HMODULE;
  ModuleFileName: string;
  ExportNames: TStringList;
  ExportName: string;

procedure GetProcessList;
begin
  ProcessList := TStringList.Create;

  // Enumerar procesos
  EnumProcesses(@ProcessID, @ProcessCount, 0);

  while ProcessID <> 0 do
  begin
    // Obtener nombre del proceso
    ProcessList.Add(GetProcessName(ProcessID));

    // Incrementar a siguiente proceso
    ProcessID := Next(ProcessID);
  end;
end;

function GetProcessName(ProcessID: DWORD): string;
var
  ProcessName: array[MAX_PATH] of Char;
  ReturnLength: DWORD;
begin
  ReturnLength := sizeof(ProcessName);

  // Obtener nombre del proceso
  if OpenProcess(PROCESS_QUERY_INFROMATION, False, ProcessID) = 0 then
    FillChar(ProcessName, sizeof(ProcessName), #0)
  else
    QueryFullProcessImageName(OpenProcess(PROCESS_QUERY_INFROMATION, False, ProcessID), &ReturnLength, ProcessName);

  CloseHandle(OpenProcess(PROCESS_QUERY_INFROMATION, False, ProcessID));

  // Convertir a string
  GetProcessName := PChar(ProcessName);
end;

procedure ListModuleExports(ProcessID: DWORD);
var
  ModuleInfo: TModuleInfo;
begin
  // Obtener información del módulo principal
  EnumProcessModules(ProcessID, @ModuleHandle, 1, @ModuleCount);

  // Obtener nombre del módulo principal
  GetModuleFileNameEx(GetCurrentProcess, ModuleHandle, ModuleFileName, sizeof(ModuleFileName));

  // Enumerar funciones exportadas
  EnumProcessModules(ProcessID, @ModuleHandle, 1, @ModuleCount);
  EnumModuleExports(ModuleHandle, @ModuleInfo, 1, @ModuleCount);

  ExportNames := TStringList.Create;

  while ModuleInfo.dwSize <> 0 do
  begin
    // Agregar nombre de la función exportada
    ExportNames.Add(ModuleInfo.szModule + ModuleInfo.dwProcNameOffset);

    // Pasar al siguiente módulo
    ModuleInfo := Next(ModuleInfo);
  end;

  // Mostrar lista de funciones exportadas
  WriteLn('Funciones exportadas de ' + ModuleFileName + ':');
  for ExportName in ExportNames do
  begin
    WriteLn(ExportName);
  end;

  ExportNames.Free;
end;

procedure Main;
var
  SelectedProcess: string;
  ProcessID: DWORD;
begin
  // Obtener lista de procesos
  GetProcessList;

  // Mostrar lista de procesos
  WriteLn('Lista de procesos:');
  for ProcessName in ProcessList do
  begin
    WriteLn(ProcessName);
  end;

  // Solicitar al usuario que seleccione un proceso
  WriteLn('Seleccione un proceso: ');
  SelectedProcess := ReadLn;

  // Buscar ID del proceso seleccionado
  ProcessID := FindProcessID(SelectedProcess);

  if ProcessID = 0 then
  begin
    WriteLn('Error: No se encontró el proceso seleccionado.');
  end
  else
  begin
    // Mostrar funciones exportadas del proceso seleccionado
    ListModuleExports(ProcessID);
  end;
end.

begin
  Main;
end.

