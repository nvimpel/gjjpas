program zaznam;
uses crt;

type Tzamestnanec = record
                    pr:string[20];
                    meno:string[10];
                    plat:real;
                    vek:byte;
                    sex:boolean; {true - male, false - female}
                    end;

var zamestnanec:Tzamestnanec;
    pohl:char;

begin
    clrscr;
    writeln('Zadaj krsne meno zamestnanca: ');
    readln(zamestnanec.meno);
    writeln('Zadaj priezvisko: ');
    readln(zamestnanec.pr);
    writeln('Zadaj plat: ');
    readln(zamestnanec.plat);
    writeln('Zadaj vek: ');
    readln(zamestnanec.vek);
    repeat 
        writeln('Zadaj pohlavie [m/z]: ');
        readln(pohl);
    until ((pohl = 'm') OR (pohl = 'z'));
    if pohl = 'm' then zamestnanec.sex := 1 else zamestnanec.sex := 0;
    readln();
    clrscr;
    write('MENO':11, 'PRIEZVISKO':21, '')
end.