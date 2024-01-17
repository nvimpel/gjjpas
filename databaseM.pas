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
{Vypis hlavicky tabulky}
procedure Hlavicka();
begin
    clrscr;
    writeln('RODNE C.':11, 'MENO':11, 'PRIEZVISKO':21, 'PLAT':6, 'POHLAVIE':9);
end;
{Vypis jedneho cloveka}
procedure VypisCloveka(clovek:TClovek);
begin
    write(clovek.rc:11, clovek.meno:11, clovek.pr:21, clovek.plat:6);
    if clovek.sex = true then writeln('Muz':9) else writeln('Zena':9);
end;

{Funkcia na testovanie delitelnosti rodneho cisla}
function numberTest(rc:string):boolean;
var even, odd:integer;
    i,n:byte;
    localNumberTest:boolean;
begin
    even := 0;
    odd := 0;
    localNumberTest := false;
    {Spocitaj cisla na parnych a neparnych miestach individualne}
    for i := 1 to 10 do begin
        if i mod 2 = 0 then even := even + ord(rc[i]) - 48
        else odd := odd + ord(rc[i]) - 48;
    end;
    n := abs(odd - even);
    {Rozdiel musi byt delitelny 11 - pravidlo rodnych cisel}
    if ((n mod 11 = 0) or (n = 0)) then localNumberTest := true;
    numberTest := localNumberTest;
end;
{Funkcia na testovanie rodneho cisla}
function testRC(rc:string):boolean;
var duo:string[2]; {dvojica cisel}
    valDuo:integer; {dvojica cisel premenena na integer}
    err:byte;
    localTestRC:boolean;
begin
    localTestRC := true;
    {Testuj dlzku rodneho cisla}
    if length(rc) <> 10 then localTestRC := false;
    duo := copy(rc, 3, 2);
    val(duo, valDuo,err);
    {skontroluj mesiac}
    if not(((valDuo >= 1) and (valDuo <= 12)) or ((valDuo >= 51) and (valDuo <= 62))) then localTestRC := false;
    duo := copy(rc, 5, 2);
    val(duo, valDuo,err);
    {skontroluj den}
    if not((valDuo >= 1) and (valDuo <= 31)) then localTestRC := false;
    {skontroluj pravidlo delitelnosti 11 - funkcia numberTest} 
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
{Procedure na vypis menu pre upravu udajov}
procedure menuUprav();
begin
    writeln('1. Zmen rodne cislo');
    writeln('2. Zmen meno');
    writeln('3. Zmen priezvisko');
    writeln('4. Zmen plat');
end;
{Procedure na vlozenie cloveka do databazy}
procedure Vloz();
var vklad:TClovek;
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
    if ((vklad.rc[3] = '0') or (vklad.rc[3] = '1')) then vklad.sex := true else vklad.sex := false; 
    write(subor, vklad);
end;
{Procedure na hladanie cloveka podla rodneho cisla, ID je pozicia v subore}
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
{Procedure na hladanie cloveka podla rodneho cisla, err je pozicia v subore ak error = -1 tak clovek neexistuje}
procedure Najdi();
var rc:string[10];
    err:longint;
begin
    writeln('Zadaj rodne cislo cloveka ktoreho chces najst: ');
    readln(rc);
    Hladam(rc,err);
    readln;
end;
{Procedure na opravu udajov cloveka, err je pozicia v subore ak error = -1 tak clovek neexistuje}
procedure Oprav();
var rc:string;
    opt:char;
    err:longint;
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
                if ((clovek.rc[3] = '0') or (clovek.rc[3] = '1')) then clovek.sex := true else clovek.sex := false; 
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
        end;
        seek(subor, err);
        write(subor, clovek);
    end;
end;
{Procedure na vymazanie cloveka z databazy, err je pozicia v subore ak error = -1 tak clovek neexistuje}
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
{Procedure na vypis databazy}
procedure Vypis();
var clovek:TClovek;
    size,pages,page:longint;
    i:byte;

begin
    reset(subor);
    size := filesize(subor);
    if ((size div 10 = 0) and (size > 10)) then pages := size div 10 else pages := (size div 10) + 1;
    writeln('Databaza obsahuje ', size, ' zaznamov a ', pages, ' stran po 10 zaznamov');
    writeln('Zadaj cislo strany ktoru chces vypisat: ');
    readln(page);
    Hlavicka();
    for i := 1 to 10 do begin
        if not(eof(subor)) then begin
            seek(subor, (page-1)*10 + i - 1);
            read(subor, clovek);
            VypisCloveka(clovek);
        end;
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
