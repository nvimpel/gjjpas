program database;
uses crt;
type
TClovek = record
    rc:string[10]; {rodne cislo}
    meno:string[10];
    pr:string[15];
    plat:word;
    sex:boolean; {T = muz , F = zena}
end;
Tsubor = file of TClovek;

var opt:char;
    clovek:TClovek;
    subor,tempSubor:Tsubor;

procedure Hlavicka();
begin
    clrscr;
    writeln('RODNE C.':11, 'MENO':11, 'PRIEZVISKO':21, 'PLAT':6, 'POHLAVIE':9);
end;
procedure VypisCloveka(clovek:TClovek);
begin
    write(clovek.rc:11, clovek.meno:11, clovek.pr:21, clovek.plat:6);
    if clovek.sex = true then writeln('Muz':9) else writeln('Zena':9);
end;

{Funkcia na testovanie delitelnosti rodneho cisla}
function numberTest(rc:string):boolean;
var even, odd:integer;
    i,n:byte;
    localTest:boolean;
begin
    even := 0;
    odd := 0;
    localTest := false;
    for i := 1 to 10 do begin
        if i mod 2 = 0 then even := even + ord(rc[i]) - 48
        else odd := odd + ord(rc[i]) - 48;
    end;
    n := abs(odd - even);
    if ((n mod 11 = 0) or (n = 0)) then localTest := true;
    numberTest := localTest;
end;
{Funkcia na testovanie rodneho cisla}
function testRC(rc:string):boolean;
var duo:string[2];
    valDuo:integer;
    err:byte;
    localTestRC:boolean;
begin
    localTestRC := true;
    if length(rc) <> 10 then localTestRC := false;
    duo := copy(rc, 3, 2);
    val(duo, valDuo,err);
    if not(((valDuo >= 1) and (valDuo <= 12)) or ((valDuo >= 51) and (valDuo <= 62))) then localTestRC := false;
    duo := copy(rc, 5, 2);
    val(duo, valDuo,err);
    if not((valDuo >= 1) and (valDuo <= 31)) then localTestRC := false;
    if numberTest(rc) = false then localTestRC := false;
    testRC := localTestRC;
end;
{Procedure na vypis menu}
procedure menu();
begin
    writeln('1. Vloz cloveka do databazy');
    writeln('2. Najdi cloveka podla rodneho cisla');
    writeln('3. Oprav udaje o cloveku');
    writeln('4. Vymaz cloveka z databazy');
    writeln('5. Vypis databazu');
    writeln('6. Ukonci program');
end;
procedure menuUprav();
begin
    writeln('1. Zmen rodne cislo');
    writeln('2. Zmen meno');
    writeln('3. Zmen priezvisko');
    writeln('4. Zmen plat');
    writeln('5. Zmen pohlavie');
end;
{Procedure na vlozenie cloveka do databazy}
procedure Vloz();
var vklad:TClovek;
    sex:char;
begin
    seek(subor, filesize(subor));
    repeat
        clrscr;
        write('Zadaj rodne cislo bez lomitka: ');
        readln(vklad.rc);
    until testRC(vklad.rc) = true;
    write('Zadaj krsne meno: ');
    readln(vklad.meno);
    write('Zadaj priezvisko: ');
    readln(vklad.pr);
    write('Zadaj plat: ');
    readln(vklad.plat);
    repeat
        clrscr;
        write('Zadaj pohlavie (M/Z): ');
        readln(sex);
    until ((sex = 'M') or (sex = 'Z'));
    if sex = 'M' then vklad.sex := true else vklad.sex := false;
    write(subor, vklad);
end;
procedure Hladam(rc:string; var ID:longint);
var found:boolean;
    clovek:TClovek;
begin
    found := false;
    reset(subor);
    while (not(eof(subor)) and (found = false)) do begin
        ID := filepos(subor);
        read(subor, clovek);
        if clovek.rc = rc then found := true;
    end;
    if found = true then begin
        Hlavicka();
        VypisCloveka(clovek);
    end else begin writeln('Clovek s tymto rodnym cislom neexistuje'); ID := -1; end; 
end;
procedure Najdi();
var rc:string[10];
    err:longint;
begin
    writeln('Zadaj rodne cislo cloveka ktoreho chces najst: ');
    readln(rc);
    Hladam(rc,err);
    readln;
end;
procedure Oprav();
var rc:string;
    opt:char;
    err:longint;
    sex:char;
    clovek:TClovek;
begin
    write('Zadaj rodne cislo cloveka ktoreho chces opravit: ');
    readln(rc);
    Hladam(rc, err);
    if err <> -1 then begin    
        seek(subor, err);
        read(subor, clovek);
        menuUprav();
        opt := readkey;
        clrscr;
        cursoron;
        case opt of
            '1':begin
                repeat
                    write('Zadaj rodne cislo bez lomitka: ');
                    readln(clovek.rc);
                until testRC(clovek.rc) = true;
            end;
            '2':begin
                write('Zadaj krsne meno: ');
                readln(clovek.meno);
            end;
            '3':begin
                write('Zadaj priezvisko: ');
                readln(clovek.pr);
            end;
            '4':begin
                write('Zadaj plat: ');
                readln(clovek.plat);
            end;
            '5':begin
                repeat
                    clrscr;
                    write('Zadaj pohlavie (M/Z): ');
                    readln(sex);
                until ((sex = 'M') or (sex = 'Z'));
                if sex = 'M' then clovek.sex := true else clovek.sex := false;
            end;
        end;
        seek(subor, err);
        write(subor, clovek);
    end;
end;
procedure Vymaz();
var rc:string;
    err:longint;
    clovek:TClovek;
begin
    write('Zadaj rodne cislo cloveka ktoreho chces vymazat: ');
    readln(rc);
    Hladam(rc, err);
    reset(subor);
    while not(eof(subor)) do begin
        read(subor, clovek);
        write(tempSubor, clovek);
    end;
    if err <> -1 then begin
        seek(subor, err);
        truncate(subor);
        seek(subor, filesize(subor));
        seek(tempSubor, err+1);
        while not(eof(tempSubor)) do begin
            read(tempSubor, clovek);
            write(subor, clovek);
        end;
    end;
end;
procedure Vypis();
var clovek:TClovek;
begin
    reset(subor);
    Hlavicka();
    while not(eof(subor)) do begin
        read(subor, clovek);
        VypisCloveka(clovek);
    end;
    readln;
end;


begin
    clrscr;
    assign(subor, 'data.dat');
    {$I-}
    reset(subor);
    {$I+}
    if IOResult <> 0 then begin
        rewrite(subor);
        close(subor);
        reset(subor);
    end;
    assign(tempSubor, 'temp.dat');
    rewrite(tempSubor);

    repeat
        cursoroff();
        clrscr;
        menu();
        opt := readkey;
        clrscr;
        cursoron;
        case opt of
            '1':Vloz;
            '2':Najdi;
            '3':Oprav;
            '4':Vymaz;
            '5':Vypis;
        end;
    until opt = '6';
    close(tempSubor);
    erase(tempSubor);
    close(subor);
    

end.
