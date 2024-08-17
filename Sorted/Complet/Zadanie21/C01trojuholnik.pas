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
            for j:=1 to size-i+1 do begin
                write('*');
            end;
            writeln();
        end;
        writeln();
    end;
    readln();
    close(fileIn);
end.