program bankovky;
uses crt;

var fileIn:text;
    pocty:array[1..5] of word;
    mzda:word;
    i:byte;

begin
    readln();
    clrscr;
    assign(fileIn, 'bankovky.txt');
    reset(fileIn);
    for i := 1 to 5 do pocty[i] := 0;
    while not eof(fileIn) do begin
        readln(fileIn, mzda);
        while mzda > 0 do begin
            if mzda >= 100 then begin
                inc(pocty[5]);
                mzda := mzda - 100;
            end
            else if mzda >= 50 then begin
                inc(pocty[4]);
                mzda := mzda - 50;
            end
            else if mzda >= 10 then begin
                inc(pocty[3]);
                mzda := mzda - 10;
            end
            else if mzda >= 5 then begin
                inc(pocty[2]);
                mzda := mzda - 5;
            end
            else if mzda >= 1 then begin
                inc(pocty[1]);
                mzda := mzda - 1;
            end;
        end;
    end;
    writeln('100: ', pocty[5]);
    writeln('50: ', pocty[4]);
    writeln('10: ', pocty[3]);
    writeln('5: ', pocty[2]);
    writeln('1: ', pocty[1]);
    close(fileIn);
    readln();
end.