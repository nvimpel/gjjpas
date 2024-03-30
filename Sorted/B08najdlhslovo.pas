program najdlhstring;
uses crt;
var s,longS:string;
    c:char;
    fileIn:text;
    bins:string;
begin
    readln();
    clrscr;
    assign(fileIn,'najtext.txt');
    reset(fileIn);
    longS:='';
    while not eof(fileIn) do
    begin
        read(fileIn,c);    
        if (c >= 'a')AND(c <= 'z') then s:=s+c
        else if length(s) > length(longS) then longS:=s;
        if (c = ' ')OR(c = '.') then s:='';
        if (c = chr(12)) then read(fileIn,c);
    end;
    writeln('Najdlhsie slovo: ',longS);
    writeln('Dlzka slova:', length(longS));
    readln();
    close(fileIn);
end.