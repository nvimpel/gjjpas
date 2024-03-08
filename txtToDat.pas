{program jkovertuje textovy subor do binarneho}
program convert;

uses crt;
var fileIn:text;
    fileOut:file of string[15];
    s:string[15];
    nameIn,nameOut:string;
begin
    readln(nameIn);
    nameOut:=nameIn+'.dat';
    nameIn:=nameIn+'.txt';

    assign(fileIn,nameIn);
    assign(fileOut,nameOut);
    reset(fileIn);
    rewrite(fileOut);

    while not eof(fileIn) do begin
        readln(fileIn,s);
        write(fileOut,s);
    end;

    close(fileIn);
    close(fileOut);

end.
