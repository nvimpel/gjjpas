program smsStats;

uses crt;

var n, m,sN:word;
    stlac:real;
    loadChar:char;
    sms:string;
    fileIn:text;
begin
    assign(fileIn, 'sms.txt');
    reset(fileIn);
    clrscr;
    n:=0;
    while not eof(fileIn) do begin
        
        repeat
            if loadChar = chr(10) then n:=0;
            read(fileIn, loadChar);
            if loadChar <> chr(13) then
                sms := sms + loadChar
            else read(fileIn, loadChar);
        until (length(sms) = 160) OR (eof(fileIn)) OR (loadChar = chr(10));
        inc(n);
        if sms <> '' then writeln(n, '. CAST: ', sms);
        sms := '';
    end;
    readln;
    close(fileIn);
end.
