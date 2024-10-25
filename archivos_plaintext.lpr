program archivos_plaintext;
        // Importar una unidad o libreria, sysutils es para trabajar con el sistema operativo
uses sysutils;

var archivo01: TextFile;
var bufferLectura: string;
var listaArchivo : TSearchRec;

const filename = 'mi_primer_archivo.txt';

procedure checkFile();
          begin
              AssignFile(archivo01, filename);
              if FileExists(filename) then begin
                writeln('El archivo ya existe. A continuacion, se agrega nueva informacion.');
                // Con append, agregamos informacion al final del archivo
                append(archivo01);

                writeln(archivo01,'==========NUEVO=========');
                CloseFile(archivo01);
              end else begin
                writeln('No hay archivo');
              end;
              // Aun no hemos abierto el archivo, no hace falta utilizar CloseFile.
              readln;
          end;
procedure buscar();
          begin
                   // con faAnyFile lista todo lo que se pueda encontrar
              if FindFirst('*', faAnyFile, listaArchivo) = 0 then begin;
                 repeat
                       writeln(listaArchivo.Name,'------','Size:',listaArchivo.Size);
                 until FindNext(listaArchivo)<>0;
              end;
              readln;

          end;
procedure lectura();
          begin
              AssignFile(archivo01, filename);
              if not FileExists(filename) then begin
                writeln('El archivo no existe');
              end else begin
                // Para leer usamos Reset.
                reset(archivo01);
                                 // Utilizamos EOF para determinar cuando llegamos al final del archivo.
                while not eof(archivo01) do begin
                      readln(archivo01, bufferLectura);
                      writeln(bufferLectura);
                end;
                CloseFile(archivo01);
              end;
              // Aun no hemos abierto el archivo, no hace falta utilizar CloseFile.
              readln;
          end;
// Estructura de ejemplo
// const COMANDO_FIN = '$FIN';
// repeat
//       readln(lineaTexto);
//       finDeEscritura := CompareStr(COMANDO_FIN, lineaTexto) = 0;
//       if not finDeEscritura then begin
//          Writeln(archivo01,lineaTexto);
//       end;
// until finDeEscritura;

// Para eliminar un archivo
// Erase(archivo01);
begin
  checkFile();
  // Solo podemos abrir el archivo para una tarea especifica
  // Con esta funcion, enlazamos la variable (RAM) con el archivo en el disco.
  // Para buscar el directorio en un directorio especifico, debe indicarse la ruta absoluta.
  AssignFile(archivo01, 'mi_primer_archivo.txt');

  // Ahora, para escribir datos en el archivo usamos la funcion Rewrite()
  // Verifica si el archivo existe, lo reescribe. De lo contrario, lo reescribe.
  rewrite(archivo01);

  writeln(archivo01, '==========README=========');

  // Es importante que al terminar la operacion debemos cerrar el archivo.
  CloseFile(archivo01);
  checkFile();

  lectura();
  buscar();
end.

