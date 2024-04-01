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
                if (i = 2)OR(i = size - 1) then begin
                    if (j = 1)OR(j = size) then write('*')
                    else write(' ');
                end;
                if (i > 2)AND(i < size - 1) then begin
                    if (j = 1)OR(j = size) then write('*')
                    else if (j = 2)OR(j = size - 1) then write(' ')
                    else write('*');
                end;
            end;
            writeln();
        end;
        writeln();
    end;
    readln();
    close(fileIn);
end.