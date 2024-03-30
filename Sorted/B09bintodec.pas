program bintodec;
uses crt;

var s:string;
    w:word;
    i:byte;

begin
    readln();
    clrscr;
    w:=0;
    write('Zadaj binarne cislo: ');
    readln(s);
    for i:=1 to length(s) do begin
        w:=w*2;
        if s[i]='1' then w:=w+1;
    end;
    writeln('Desiatkova hodnota: ',w);
    readln();
end.