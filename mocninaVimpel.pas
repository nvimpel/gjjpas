program mocnina_cisla;
uses crt;
var n,i,pwr:Integer;
    Ans:Real;
begin
        clrscr;

        writeln('Zadajte cislo');
        readln(n);
        Ans := n;

        writeln('Zadajte mocninu');
        readln(pwr);
        if pwr > 0 then begin
                for i:=2 to pwr do Ans := Ans * n;
        end;
        if pwr = 0 then Ans := 1;
        if pwr < 0 then begin
                for i := -2 downto pwr do Ans := Ans * n;
                Ans := 1/Ans;
        end;

        writeln(n, ' ^ ', pwr, ' = ', Ans:3:3);
        readln();

end.
