program tkniha;

uses crt;

var meno,znamky:string;
    err:integer;
    sucet,pocet,znamka:byte;
    priemer:real;
    max,i:byte;
    fileIn:text;
    
begin
    readln();
    clrscr;
    assign(fileIn, 'znamky.txt');
    reset(fileIn);
    sucet:=0;
    pocet:=0;
    while not eof(fileIn) do
    begin
        readln(fileIn, meno);
        readln(fileIn, znamky);
        sucet := 0; pocet := 0; max := 0;
        for i := 1 to (length(znamky) - 1) do begin
            val(znamky[i], znamka, err);
            sucet := sucet + znamka;
            pocet := pocet + 1;
            if znamka > max then max := znamka;
        end;
        priemer:=sucet/pocet;
        write(meno, ' ', pocet, ' znamok, primer ', priemer:0:2);
        if (priemer < 1.5) AND (max < 3) then writeln(' prospel s vyznamenanim')
        else if (priemer < 2) AND (max < 4) then writeln(' prospel velmi dobre')
        else if (max < 5) then writeln(' prospel')
        else writeln(' neprospel');
    end;
    readln();
end.