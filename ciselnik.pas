{Vzorovy program na zapisovanie udajov do textoveho suboru}
{Generuj n=1000  0 az 255}
program ciselnik;
uses crt;

var     sub:text;
        cislo:byte;
        i:word;
begin
        clrscr;
        randomize;
        assign(sub, 'bytetext.txt');
        rewrite(sub);
        for i := 1 to 1000 do begin
                cislo := Random(256);
                writeln(sub,cislo)
        end;
        close(sub);
end.
