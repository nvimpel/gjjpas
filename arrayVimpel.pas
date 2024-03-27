program arrayReverse;
uses crt;

var     A:array[1..10] of integer;
        B:array[1..20] of integer;
      n,i:byte;

begin
        clrscr;
        randomize;
        repeat
                writeln('Zadaj dlzku pola (max 10)');
                readln(n);
        until(n <= 10);

        for i := 1 to n do begin
                A[i] := Random(20001)  - 10000;
        end;

        for i := 1 to n do begin
                B[i] := A[i];
                B[(2 * n) - i + 1] := A[i];
        end;

        for i := 1 to n do write(A[i],' ');
        writeln();
        for i := 1 to 2*n do write(B[i], ' ');
        readln();
end.
