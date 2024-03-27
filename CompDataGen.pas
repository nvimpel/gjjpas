program generator;
uses crt;

var x,j,i,n:word;
    sub:text;
    row,line:string;

begin
    clrscr;
    randomize;
    assign(sub,'CompData.txt');
    rewrite(sub);
    write('Enter the number of items: ');
    readln(n);

    for i:=1 to n do begin
        row := '';
        str(Random(90)+10,line);
        row := row +  line;
        x := (Random(12)+1)+(Random(2)*50);
        writeln(x);
        str(x, line);
        if length(line) = 1 then line := '0' + line;
        row := row + line;
        for j:=1 to 6 do begin
            row := row + chr(Random(10)+48);
        end;
        row := row + ' ';
        str(Random(10000)+1,line);
        row := row + line;
        writeln(sub,row);
    end;
    readln();
    close(sub);

end.
