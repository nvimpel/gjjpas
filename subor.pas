program pokus;
uses crt;
var a,b:integer;
      c:longint;
{telo procedury x_na_y}
begin
clrscr;
write('Zadaj x pre vypocet x_na_y:');
readln(a);
write('Zadaj y pre vypocet x_na_y:);
readln(b);
x_na_y(a,b,c);
writeln('Vysledok ',a,' na ',b,' je ',c);
readln;
end.