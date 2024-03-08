{Program vykresli trojuholnik alebo specificky obrazec na zaklade podmienok v najvyssej podmienke}
program test;
uses crt;

var subIn:text;
    subOut:text;
    n,i,j:byte;

begin
    clrscr;
    assign(subIn, 'tempIn.txt');
    assign(subOut, 'tempOut.txt');
    reset(subIn);
    rewrite(subOut);
    while not(eof(subIn)) do begin
        readln(subIn, n);
        for i:=1 to n do begin
            for j:=1 to n do begin 
                if ((i=2)or(i=n-1)or((j=2) or (j=n-1))) and not((i=1)or(i=n)or(j=1)or(j=n))then write(subOut, ' ')
                else write(subOut, '*');
            end;
            writeln(subOut, '');
        end;
        writeln(subOut, '');
    end;
    close(subIn);
    close(subOut);
end.
