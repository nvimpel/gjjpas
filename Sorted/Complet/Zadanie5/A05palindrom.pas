program pali;
uses crt;

var n:word;
    sIn:string;
    fileIn,fileOut:text;

function isPali(s:string):boolean;
var b:boolean;
    l,i:byte;

begin
    b:=true;
    i:=1;
    l:=length(s);
    repeat
        if(s[i] <> s[l-i+1]) then  b := false;
        inc(i);
    until (b = false)OR(i >= (l / 2 + 1));
    isPali := b;
end;


begin
    assign(fileIn, 'slovnik.txt');
    assign(fileOut, 'palindromList.txt');
    reset(fileIn);
    rewrite(fileOut);

    {if isPali('acka') then writeln('ano');}
    while not(eof(fileIn)) do begin
        readln(fileIn, sIn);
        if (isPali(sIn)) then begin
            writeln(fileOut, sIn);
            inc(n);
        end;
    end;
    clrscr;
    writeln(n);
    readln();
    close(fileIn);
    close(fileOut);
end.