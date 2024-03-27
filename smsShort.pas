program smsStats;

uses crt;

var loadChar:char;
    fileIn:text;
begin
    assign(fileIn, 'sms.txt');
    reset(fileIn);
    clrscr;
    
    while not eof(fileIn) do begin
        repeat
            read(fileIn, loadChar);
            if loadChar <> ' ' then write(loadChar);
        until loadChar = chr(13);
        writeln();
        read(fileIn, loadChar);
    end;
    readln;
    close(fileIn);
end.
