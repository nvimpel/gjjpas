{Generuj n=1000  0 az 255v binarnom subore}
program ciselnik;
uses crt;

var     sub:file of byte;
        cislo:byte;
        i:word;
begin
        clrscr;
        randomize;
        assign(sub, 'bytedat.dat');
        rewrite(sub);
        for i := 1 to 1000 do begin
                cislo := Random(256);
                write(sub,cislo)
        end;
        close(sub);
end.