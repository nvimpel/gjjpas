{program ulozi hodnoty z textoveho suboru do binarneho suboru konkretne WORD}
program test;

uses crt;

var     mzda:word;
        riadok,sMzda:string;
        err:integer;
        inSub:text;
        outSub:file of word; 

begin
    clrscr;

    assign(inSub, 'CompData.txt');
    assign(outSub, 'MzdaData.dat');

    reset(inSub);
    rewrite(outSub);

    while not(eof(inSub)) do begin
        readln(inSub, riadok);
        sMzda := copy(riadok, 12, length(riadok) - 11);
        val(sMzda, mzda, err);
        if err = 0 then write(outSub, mzda)
        else writeln('Error ', err);
    end;
    close(inSub);
    close(outSub);
    readln();
    
end.
