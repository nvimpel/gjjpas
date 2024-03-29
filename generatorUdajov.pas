{program generuje vzorove udaje pre databazu pouzivanu v programe databaseM, generuje Meno,Priezvisko,Vek,Pohlavie. RODNE CISLO ma spravny (pouzitelny) tvar}
Program generator;
uses crt;
type
TMeno = string[10];
TPr = string[15];
TClovek = record
    rc:string[10]; {rodne cislo}
    meno:string[10];
    pr:string[15];
    plat:word;
    sex:boolean; {T = muz , F = zena}
end;
Tsubor = file of TClovek;
var namesW,namesM:file of string[10];
    surnamesW,surnamesM:file of string[15];
    meno : TMeno;
    pr: TPr;
    mesiace:text;

	fileOut:Tsubor;
	i,n,j,m:longint;
	clovek:TClovek;
	mesiac,even,odd,l:byte;
	h:integer;
    s:string;

function year():string;
var s:string;
    h:integer;
begin
    s := '';   
    h:= Random(100);
    str(h,s);
    if h <= 9 then year := '0' + s else year := s;
end;
function month(var mesiac:byte):string;
var s:string;
    h:integer;
begin
    month := '';
    s := '';
    mesiac := (Random(12)+1);
    h :=  mesiac + (Random(2)*50);
    str(h,s);
    if h <= 9 then month := month + '0' + s else month := month + s;
end;

function day(mesiac:integer):string;
var s:string;
    h:integer;
    den:byte;
begin
    s := '';
    day := '';
    reset(mesiace);
    for j := 1 to mesiac do begin
        readln(mesiace, h);
    end;
    h := Random(h) + 1;
    str(h,s);
    if h <= 9 then day := day + '0' + s else day := day + s;
    
end;
function rand3():string;
var s:string;
    h:integer;
begin
    h := Random(1000);
    str(h,s);
    if h <= 9 then rand3 := '00' + s else if h <= 99 then rand3 := '0' + s else rand3 := s;
end;
function controlNum():string;
var s:string;
    h:integer;
    m:byte;
begin
    even := 0;
    odd := 0;
    for l := 1 to 9 do begin
        if l mod 2 = 0 then even := even + ord(clovek.rc[l]) - 48
        else odd := odd + ord(clovek.rc[l]) - 48;
    end;
    m := abs(odd - even);
    {Rozdiel musi byt delitelny 11 - pravidlo rodnych cisel}
    if ((m mod 11 = 0) or (m = 0)) then h := 0
    else h := 11 - (m mod 11); 
    str(h,s);
    controlNum := s;
end;
Begin

	randomize;
	assign(namesW, 'namesW.dat');
    assign(namesM, 'namesM.dat');
	assign(surnamesM, 'sorted.dat');
    assign(surnamesW, 'sortedW.dat');
    assign(mesiace, 'mesiace.txt');
    assign(fileOut, 'data.dat');
    {$I-}
    reset(fileOut);
    {$I+}
    if IOResult <> 0 then begin
        rewrite(fileOut);
        close(fileOut);
        reset(fileOut);
    end;
	
    writeln('Zadaj počet ludi na vygenerovanie');
	readln(n);
    seek(fileOut, filesize(fileOut));
    for i:= 1 to n do begin
        
        mesiac := 0;
		clovek.rc := '';
        clovek.rc := clovek.rc + year();
        clovek.rc := clovek.rc + month(mesiac);
        clovek.rc := clovek.rc + day(mesiac);
        clovek.rc := clovek.rc + rand3();
        if controlNum() = '10' then clovek.rc[9] := chr(ord(clovek.rc[9]) - 1);
        clovek.rc := clovek.rc + controlNum();
        
        
        if ((clovek.rc[3] = '0') or (clovek.rc[3] = '1')) then clovek.sex := true else clovek.sex := false;
        

        
        if clovek.sex then begin
            reset(namesM);
            h:= Random(filesize(namesM) - 1) + 1;
            seek(namesM, h);
            read(namesM, meno);
            clovek.meno := meno;

            reset(surnamesM);
            h:= Random(filesize(surnamesM) - 1) + 1;
            seek(surnamesM, h);
            read(surnamesM, pr);
            clovek.pr := pr;
        end
        else begin
            reset(namesW);
            h:= Random(filesize(namesW) - 1) + 1;
            seek(namesW, h);
            read(namesW, meno);
            clovek.meno := meno;

            reset(surnamesW);
            h:= Random(filesize(surnamesW) - 1) + 1;
            seek(surnamesW, h);
            read(surnamesW, pr);
            clovek.pr := pr;
        end;

        
        
        clovek.plat := Random(10000)+100;
        
        writeln(clovek.meno, ' ',clovek.pr, ' ',clovek.plat, ' ',clovek.rc, ' ');
        
        write(fileOut, clovek);


    end;
	close(namesM);
    close(namesW);
	close(surnamesM);
    close(surnamesW);
	close(mesiace);
    close(fileOut);
    readln();

End.
