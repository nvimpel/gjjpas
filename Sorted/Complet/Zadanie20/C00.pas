program fibonaciho;
uses crt;

var n:byte;
    w:word;

function fibonaci(n:byte):word;
var a:word;
begin  
    if n = 1 then a := 1
    else if n = 2 then a := 1
    else a := fibonaci(n-1) + fibonaci(n-2);
    fibonaci := a;
end;
begin
    readln();
    clrscr;
    write('Zadaj parameter n fibonaciho postupnosti n : '); 
    readln(n);
    w := fibonaci(n);
    writeln('Fibonaciho postupnost ',n,' je ',w);
    readln();
end.