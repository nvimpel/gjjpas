{Nie je perfektne, niektore vysledky sa nezhoduju so vzorovym riesenim ale nepriseil som na to ze preco}

program smsStats;

uses crt;

var n, c, m,sN:word;
    stlac:real;
    loadChar:char;
    fileIn:text;
begin
    assign(fileIn, 'sms.txt');
    reset(fileIn);
    clrscr;
    
    while not eof(fileIn) do begin
        n:=0;c:=0;m:=0;
        repeat
            read(fileIn, loadChar);
            inc(n);
            if loadChar = ' ' then inc(m) else inc(c);
        until loadChar = chr(13);
        n := n - 1;
        read(fileIn, loadChar);
        writeln('Pocet znakov: ', n);
        sN := n div 160 + 1;
        writeln('Pocet sprav: ', sN);
        writeln('Pocet medzier: ', m);
        stlac := c/n*100;
        writeln('Stlacenie: ', stlac:0:2, '%');
    end;
    readln;
    close(fileIn);
end.
