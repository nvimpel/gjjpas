program trojuholnik;
uses crt;

var fileIn:text;
    size:byte;
    i,j:byte;


begin
    readln();
    clrscr;
    assign(fileIn, 'guide.txt');
    reset(fileIn);

    while not eof(fileIn) do begin
        readln(fileIn, size);
        for i:=1 to size do begin
            for j:=1 to size do begin
                if (i = 1)OR(i = size) then write('*');
                if (i > 1)AND(i < size) then begin
                    if (j = 1)OR(j = size) then write('*');
                    if (j > 1)AND(j < size) then write(' ');
                end;
            end;
            writeln();
        end;
        writeln();
    end;
    readln();
    close(fileIn);
end.