program kalkulacka;
uses crt;
var V,S,d,r,vV,pi :real;

begin
    clrscr;

    pi := 3.14;

    write('Zadaj priemer podstavy valca v cm. d = ');
    readln(d);
    r:=d / 2;
    write('Zadaj vysku valca v cm. v = ');
    readln(vV);

    V := pi * SQR(r) * vV;
    S := 2 * pi * r * (r + vV);
    writeln('Objem valca je ', V:3:2, ' cm^3. Povrch valca je ', S:3:2, ' cm^2');
    readln();
end.
