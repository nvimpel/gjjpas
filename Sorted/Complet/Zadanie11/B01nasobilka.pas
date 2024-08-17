{program generuje priklady na malu nasobilku a nasledne vyhodnocuje uspesnost}
program nasobilka;
uses crt;

var n,o,c,x,y,z,i:byte;
    p:real;
    chyby:Array[1..10] of boolean;
begin
    randomize;
    c:=0;
    
    repeat
        clrscr;
        write('Zadaj pocet prikladov: ');
        readln(n);
        writeln();
    until (n <= 10);
    for i := 1 to n do chyby[i] := false;

    for i := 1 to n do begin
        x := Random(11);y:=Random(11)+1;z:=x*y;
        write(x,' * ',y,' = ');
        readln(o);
        if o = z then begin
            writeln('Spravne');
            c:=c+1;
        end
        else begin
            writeln('Nespravne');
            chyby[i] := true;
        end;
        writeln();
    end;
    writeln('Spravne so vyriesil ',c,' z ', n,' prikladov');
    p:=c/n*100;
    writeln('Uspesnost = ', p:0:0, '%');
    if c <> n then write('Nespravne priklady c.: ');
    for i:=1 to n do if chyby[i] then write(i,'. ');
    readln; 
end.
