program kvadra;
uses crt;

var a,b,c,D,x1,x2:real;

begin
    repeat
        clrscr;
        writeln('zadaj koeficient a (a nesmie byt rovne 0)');
        readln(a)    
    until a <> 0;
    writeln('zadaj koeficient b');
    readln(b);
    writeln('zadaj koeficient c');
    readln(c);

    D := (b*b)-(4*a*c);
    writeln('diskriminant je: ',D:0:2);
    readln();

    if D > 0 then begin
        x1 := (0 - b + sqrt(D)) / (2*a);
        x2 := (0 - b - sqrt(D)) / (2*a);
        writeln('Rovnioca ma dva korene');
        writeln('x1 = ',x1:0:2);
        writeln('x2 = ',x2:0:2);
    end
    else if D = 0 then begin
        x1 := (0 - b) / (2*a);
        writeln('Rovnica ma jeden  koren');
        writeln('x = ',x1:0:2);
    end
    else if D < 0 then writeln('Rovnica nema riesenie');

    readln();
    
end.