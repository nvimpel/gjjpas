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
TConfig = string[20];
TSortArray = array['A'..'Z'] of longint;
Tsubor = file of TClovek;

var opt:char;
    clovek:TClovek;
    subor,tempSubor:Tsubor;
    suborName:TConfig;
    configF:file of TConfig;
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
    err,i:byte;
    localTestRC:boolean;
begin
    localTestRC := true;
    {Testuj dlzku rodneho cisla}
    if length(rc) <> 10 then localTestRC := false;
    for i:=1 to 10 do begin
        if not((rc[i] >= '0') and (rc[i] <= '9')) then localTestRC := false;
    end;
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
    writeln('6. Nastavenia');
    writeln('7. Ukonci program');
end;

{Procedure na vypis menu pre upravu udajov}
procedure menuUprav();
begin
    writeln('1. Zmen rodne cislo');
    writeln('2. Zmen meno');
    writeln('3. Zmen priezvisko');
    writeln('4. Zmen plat');
end;

procedure menuNastavenia();
begin
    writeln('1. Zmen subor databazy (momentalne:', suborName, ')');
    writeln('2. Zorad databazu podla abecedy priezviska');
    writeln('3. Vymaz databazu');
    writeln('4. Naspat');
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
function nameValid(name:string):boolean;
var i:byte;
    valid:boolean;
begin
    valid := true;
    for i := 1 to length(name) do begin
        if not(((name[i] >= 'a') and (name[i] <= 'z')) or ((name[i] >= 'A') and (name[i] <= 'Z'))) then valid := false;
    end;
    nameValid := valid;
end;

{Procedure na vlozenie cloveka do databazy}
procedure Vloz();
var clovek,clovek2:TClovek;
    err,n:longint;
    rc:string[10];
    contrl:real;
begin
        
    
    repeat
        clrscr;
        write('Zadaj rodne cislo bez lomitka: ');
        readln(rc);
    until (testRC(rc) = true) or (rc = '');
    if rc <> '' then begin    
        Hladam(rc,err);
        clrscr;
        if err = -1 then begin 
            clovek.rc := rc;
            repeat    
                clrscr;
                write('Zadaj krsne meno: ');
                readln(clovek.meno);
            until nameValid(clovek.meno) = true;
            if clovek.meno[1] in ['a'..'z'] then clovek.meno[1] := chr(ord(clovek.meno[1]) - 32);
            repeat
                write('Zadaj priezvisko: ');
                readln(clovek.pr);
            until nameValid(clovek.pr) = true;
            if clovek.pr[1] in ['a'..'z'] then clovek.pr[1] := chr(ord(clovek.pr[1]) - 32);
            write('Zadaj plat: ');
            readln(contrl);
            clovek.plat := round(contrl);
            if ((clovek.rc[3] = '0') or (clovek.rc[3] = '1')) then clovek.sex := true else clovek.sex := false; 
            
            rewrite(tempSubor);
            reset(subor);
            while not(eof(subor)) do begin
                read(subor, clovek2);
                write(tempSubor, clovek2);
            end;
            reset(subor);
            n := -1;
            while not(eof(subor)) and (n = -1) do begin
                read(subor, clovek2);
                if (clovek2.pr > clovek.pr)  then begin
                    n := filepos(subor) - 1;
                end;
            end;
            if n <> -1 then begin
                seek(subor, n);
                truncate(subor);
                seek(subor, filesize(subor));
                write(subor, clovek);
                seek(tempSubor, n);
                while not(eof(tempSubor)) do begin
                    read(tempSubor, clovek);
                    write(subor, clovek);
                end;
            end 
            else begin
                seek(subor, filesize(subor));
                write(subor, clovek);
            end;
            readln;
        end;
    end;
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
                repeat
                    clrscr;
                    write('Zadaj krsne meno: ');
                    readln(clovek.meno);
                until nameValid(clovek.meno) = true;
                if clovek.meno[1] in ['a'..'z'] then clovek.meno[1] := chr(ord(clovek.meno[1]) - 32);
            end;
            '3':begin
                repeat
                    clrscr;
                    write('Zadaj priezvisko: ');
                    readln(clovek.pr);
                until nameValid(clovek.pr) = true;
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
    rewrite(tempSubor);
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
{Procedure na zmenu suboru s databazou}
procedure zmenSubor();
begin
    clrscr;
    close(subor);
    write('Zadaj nazov suboru: ');
    readln(suborName);
    assign(subor, suborName);
    {$I-}
    reset(subor);
    {$I+}
    if IOResult <> 0 then begin
        rewrite(subor);
        close(subor);
        reset(subor);
    end;
    reset(configF);
    write(configF, suborName);
end;

{Procedura kontrolujuca ci je databaza zoradena}
function isSorted:boolean;
var clovek,clovek2:TClovek;
    i:byte;
    sorted:boolean;
begin
    sorted := true;
    reset(subor);
    read(subor, clovek);
    while not(eof(subor)) do begin
        read(subor, clovek2);
        if clovek.pr > clovek2.pr then sorted := false;
        clovek := clovek2;
    end;
    isSorted := sorted;

end;
{Funkcia na rekurzivne spocitanie prvkov v poli}
function RecursiveCount(eachElement:TSortArray; n:longint; letter:char):longint;
var i:char;
    count:longint;
begin
    if letter = '@' then count := 0
    else begin
        count := eachElement[letter] + RecursiveCount(eachElement, n, chr(ord(letter)-1));
    end;
    RecursiveCount := count;
end;
{Procedure na zoradenie databazy podla abecedy priezviska}
procedure zoradPriezvisko();
var eachElement,doneElements:TSortArray;
    i,j,n:longint;
    clovek,clovek2:TClovek;
    a:char;
begin
    for a := 'A' to 'Z' do begin
        eachElement[a] := 0;
        doneElements[a] := 0;
    end;
    if isSorted() = false then begin
        reset(subor);
        while not(eof(subor)) do begin
            read(subor, clovek);
            eachElement[clovek.pr[1]] := eachElement[clovek.pr[1]] + 1;
            
        end;
        doneElements := eachElement;
        reset(subor);
        rewrite(tempSubor);
        while not(eof(subor)) do begin
            read(subor, clovek);
            write(tempSubor, clovek);
        end;
        reset(subor);
    readln;
        for i := 1 to 26 do begin
            while not(eof(subor)) do begin
                read(subor, clovek);
                n := eachElement[clovek.pr[1]] - doneElements[clovek.pr[1]];
                seek(tempSubor, n + RecursiveCount(eachElement, n, chr(ord(clovek.pr[1])-1)));
                write(tempSubor, clovek);
                doneElements[clovek.pr[1]] := doneElements[clovek.pr[1]] - 1;
                
            end;
        end;
        
        readln;
        close(subor);
        rewrite(subor);
        
        j := 0;
        for a := 'A' to 'Z' do begin
            i := j;
            while i < j + eachElement[a] do begin
                if i < filesize(tempSubor) - 1 then begin
                    seek(tempSubor, i);
                    read(tempSubor, clovek);
                    read(tempSubor, clovek2);
                    writeln('load ', i);
                    readln;
                    if clovek.pr > clovek2.pr then begin
                        seek(tempSubor, i);
                        write(tempSubor, clovek2);
                        write(tempSubor, clovek);
                    end;
                end;
                i := i + 1;
                writeln('passed');
                readln;
            end;
            j := j + eachElement[a];
        end;

        reset(tempSubor);
        while not(eof(tempSubor)) do begin
            read(tempSubor, clovek);
            write(subor, clovek);
        end;


    end else begin
        clrscr;
        writeln('Databaza je uz zoradena');
        readln;
    end;
end;

{Procedure na vymazanie databazy}
procedure wipeAll();
var opt:char;
sure:string;
begin
    writeln('Naozaj chces vymazat databazu? (y/n)');
    opt := readkey;
    if opt = 'y' then begin
        writeln('Napis:vymazat');
        readln(sure);
        if sure = 'vymazat' then begin
            rewrite(subor);
            close(subor);
            reset(subor);
            rewrite(tempSubor);
            close(tempSubor);
            reset(tempSubor);
            clrscr;
            writeln('Databaza bola vymazana');
            readln;
        end;
    end;
end;

procedure Nastavenia();
var opt:char;
begin
    repeat
        cursoroff();
        clrscr;
        menuNastavenia();
        opt := readkey;
        clrscr;
        cursoron;
        case opt of
            '1':zmenSubor();
            '2':zoradPriezvisko();
            '3':wipeAll();
        end;
    until opt = '4';
end;

begin
    clrscr;
    assign(configF, 'configF.dat');
    {$I-}
    reset(configF);
    {$I+}
    if IOResult <> 0 then begin
        rewrite(configF);
        close(configF);
        reset(configF);
        suborName := 'data.dat';
        write(configF, suborName);
        reset(configF);
    end;
    read(configF, suborName);

    assign(subor, suborName);
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
            '6':Nastavenia;
        end;
    until opt = '7';
    close(tempSubor);
    erase(tempSubor);
    close(subor);
end.
