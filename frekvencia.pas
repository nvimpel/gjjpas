program frek;
uses crt;

var hlasky:array['a'..'z'] of word;
    fileIn:text;
    s:string;
    i:byte;
    c:char;
    per:real;
    n:word;
begin
    readln(); {debug line}
    clrscr();
    assign(fileIn, 'frek.txt');
    reset(fileIn);
    n:=0;
    for c := 'a' to 'z' do hlasky[c] := 0;
    while not eof(fileIn) do
    begin
        readln(fileIn, s);
        for i:=1 to length(s) do begin
            if (s[i] >= 'a') and (s[i] <= 'z') then begin
                hlasky[s[i]] := hlasky[s[i]] + 1;
                n := n + 1;
            end;
        end;
    end;
    for c := 'a' to 'z' do write(c, ' -', hlasky[c]:2, '      ');
    writeln();
    for c := 'a' to 'z' do begin
        per := (hlasky[c] / n) * 100;
        write(c, ' -', per:6:2, '% ');
    end;
    readln();
    close(fileIn);
end.