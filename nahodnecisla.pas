program nahodnecisla;
uses crt;

var pole:array[1..25] of byte;
    n,i:byte;


begin
    randomize;
    clrscr;
    for i:=1 to 25 do pole[i] := 0;

    for i:=1 to 25 do begin 
        repeat
            n := random(25)+1;
            if pole[n] = 0 then pole[n] := i;
        until pole[n] = i;
        writeln('done ', i);
    end;
    for i:=1 to 25 do write(pole[i]:2, ' ');
    readln;
end.