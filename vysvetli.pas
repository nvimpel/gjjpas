program arrayCopy;
uses crt;
var      A,B:array[1..10] of integer;
         n,i:byte;

begin
        clrscr;
        randomize;
        repeat
                writeln('Dlzka?');
                readln(n);
        until n<=10;
        for i := 1 to n do A[i] := Random(20001) - 10000;
        for i := 1 to n do begin
                B[n-i+1] := A[i];
        end;


        for i := 1 to n do write(A[i], ' ');
        writeln();
        for i := 1 to n do write(B[i], ' ');

        readln();

end.