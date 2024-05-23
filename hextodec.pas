program hextodec;
uses crt;

var hex:string[4];
    dec:word;

function conv(hex:string):word;
var i:byte;
    dec:word;
begin
    clrscr;
    dec := 0;
    for i := 1 to length(hex) do
    begin
        if (hex[i] >= '0') and (hex[i] <= '9') then
            dec := dec * 16 + ord(hex[i]) - ord('0')
        else
            dec := dec * 16 + ord(hex[i]) - ord('A') + 10;
    end;
    conv := dec;
end;

begin
    clrscr;
    writeln('Zadaj hex cislo (max FFFF): ');
    readln(hex);
    dec := conv(hex);
    writeln('Dec: ', dec);
    readln();
end.
