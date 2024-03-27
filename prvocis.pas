program testprvocislo;

uses crt;
var x,y,i,n,hi:longint;
function prvocislo(a:longint):boolean; {true-je;false-nie je}
var i:longint; sqra:longint; is:boolean;
begin
        {sqra:=round(sqrt(a));
        is:=true;
        if a > 3 then begin
                i:=2; if (a mod i) = 0 then is:=false; inc(i);
                repeat
                        if (a mod i) = 0 then is:=false;
                        i:=i+2;
                until (i>sqra) or not(is);
        end;
        if a = 1  then is:=false;}

        sqra:=round(sqrt(a));
        is:=true;
        if a > 3 then begin
                i:=sqra; if (a mod i) = 0 then is:=false; dec(i);
                if (i mod 2) = 0 then dec(i);
                repeat
                        if (a mod i) = 0 then is:=false;
                        i:=i-2;
                until (i<3) or not(is);
        end;
        if a = 1  then is:=false;

        {is:=true; i:=2;
        if (a = 2) or (a = 3) then is:=true
        else begin
        inc(i);
        repeat
                if (a mod i) = 0 then is := false;
                i:=i+2;
        until (i>=sqra) or not(is);
        end;}
        prvocislo:=is;
end;

begin
clrscr;
repeat
    clrscr;
    writeln('Zadaj pociatocnu hodnotu intervalu');
    readln(x);
    writeln('Zadaj konecnu hodnotu intervalu');
    readln(y);
until x<=y;
n:=0;
i:=x;
repeat
if prvocislo(i) then begin hi:=i; inc(n); end;
inc(i);
until i>y;
writeln('Pocet prvocisel = ', n);
writeln('Najvacsie prvocislo = ', hi);
readln();
end.

