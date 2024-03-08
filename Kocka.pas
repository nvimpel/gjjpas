program statsKocka;
uses crt;

var hody:Array[2..12] of word;
    pH,i,j:word;
    hod,k1,k2:byte;
    subOut:text;

begin
    clrscr;
    randomize;
    assign(subOut, 'hody.txt');
    rewrite(subOut);
    for i := 2 to 12 do hody[i]:=0;
    writeln('Zadaj pocet hodov');
    readln(pH);

    for i := 1 to pH do begin
        k1 := Random(6)+1;k2 := Random(6)+1;
        hod := k1 + k2;
        {writeln(k1,' + ',k2,' = ', hod);}
        INC(hody[hod]);
    end;
    for i := 2 to 12 do writeln(subOut, i:2,': ',hody[i],'x');
    
    for i := 2 to 12 do begin
        for j := 0 to Round(hody[i] / pH * 100) do write('*');
        writeln();
    end;
    close(subOut);
    readln();
end.