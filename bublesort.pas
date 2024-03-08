{Generuje pole ktore nasledne usporiada pomocou bublikovej metody triedenia O:n^2}
program bubleSort;
uses crt;
var           A:array[1..15] of integer;
              n,i:byte;
           temp:integer;
          check:boolean;
begin
        clrscr;
        randomize;
        for i:=1 to 15 do A[i] := random(20001)-10000;
        writeln('Pole A neusporiadane:');
        for i:=1 to 15 do write(A[i],' ');
        writeln();
        n:=0;
        repeat
                check := false;
                for i:=1 to 15-1-n do begin
                        if A[i] > A[i+1] then begin
                                temp := A[i];
                                A[i] := A[i+1];
                                A[i+1] := temp;
                                check := true;
                                end;
                end;
                inc(n);
        until (check = false) or (n >= 14);
        writeln('Pole A usporiadane:');
        for i:=1 to 15 do write(A[i],' ');
        writeln(n);
        readln;
end.
