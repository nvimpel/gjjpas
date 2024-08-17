program loptickovac;
uses crt;


var nad1,i:byte; 
    K,currH:real;
    table:array[0..10] of real;

begin
    clrscr;
    write('Zadejte pociatocnu vysku lopticky: ');
    readln(currH);
    write('Zadejte koeficient odrazu: ');
    readln(K);

    table[0]:=currH;
    i := 1; nad1 := 0;
    repeat 
        currH := currH * K;
        if (currH > 1) then inc(nad1);
        if (i <= 10) then table[i] := currH;
        inc(i);
    until (currH <= 1)AND(i>10);

    writeln(nad1);
    for i := 0 to 10 do begin
        if (table[i] > 1) then begin
            if table[i] = trunc(table[i]) then writeln(i, ': ',trunc(table[i]), ' m')
            else writeln(i, ': ',table[i]:0:2, ' m');
        end
        else begin
            if   trunc(table[i] * 1000) = trunc(table[i]*100)*10 then writeln(i, ': ',trunc(table[i]*100), ' cm')
            else writeln(i, ': ',table[i]*100:0:1, ' cm');
        end;
    end;
    readln();
end.