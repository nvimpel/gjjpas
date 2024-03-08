program tipniCislo;
uses crt;

var winTable:text;
    meno:string;   
    min,max,x,z,n:word;

begin
    clrscr;
    randomize;
    n:=0;
    assign(winTable, 'tabulkaTiperov.txt');
    {$I-}
    append(winTable);
    {$I+}
    if IOResult <> 0 then begin
        rewrite(winTable);
        close(winTable);
        reset(winTable);
    end;

    write('Zadaj minimalnu hodnotu na tipovanie ');
    readln(min);
    repeat 
        clrscr;
        write('Zadaj maximalnu hodnotu na tipovanie ');
        readln(max);
    until max >= min;

    x := Random(max-min)+min;
    clrscr;
    repeat
        writeln('Zadaj svoj tip <', min, '; ' , max,'>' );
        readln(z);
        INC(n);
        if z > x then writeln('Nezname cislo je mensie ako ', z);
        if z < x then writeln('Nezname cislo je vacsie ako ', z);
    until x = z;
    writeln('Spravne uhadol si, pocet pokusov: ', n);
    write('Zadaj svoje meno: ');
    readln(meno);
    writeln(winTable, meno, ' ', n);
    readln();
    close(winTable);
end.