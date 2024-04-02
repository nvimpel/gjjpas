program hovory;
uses crt;
var fileIn:text;
    n:word;
    hovor:word;
    hod,min,sec:byte;
    s:string;

function toString(cas:byte):string;
begin
    str(cas,s);
    if cas < 10 then
        s:='0'+s;
    toString:=s;
end;

begin
    readln(); {debug line}
    assign(fileIn, 'hovory.txt');
    reset(fileIn);
    while not eof(fileIn) do begin
        readln(fileIn, hovor);
        INC(n);
    end;
    writeln('Pocet hovorov: ', n);
    reset(fileIn);
    while not eof(fileIn) do begin
        sec:=0;
        min:=0;
        hod:=0;
        readln(fileIn, hovor);
        while hovor >= 60 do begin
            INC(min);
            hovor := hovor - 60;
        end;
        sec:=hovor;
        while min >= 60 do begin
            INC(hod);
            min := min - 60;
        end;
        if hod > 0 then begin
            s := ':'+toString(min)+':'+toString(sec);
            writeln(hod:2,s);
        end
        else begin
            s:=':'+toString(sec);
            writeln(min:5,s);
        end;
    end;
    close(fileIn);
    readln();
end.