program nakupy;
uses crt;

var zakaznici:array[1..99] of word;
    value,max:word;
    maxS,id:string;
    i:byte;


    fileIn:text;

begin
    readln();
    clrscr;
    assign(fileIn, 'nakupy.txt');
    reset(fileIn);
    max:=0;
    maxS:='';
    while not eof(fileIn) do begin
        readln(fileIn, i, value);
        zakaznici[i]:=zakaznici[i]+value;
    end;

    for i:=1 to 99 do begin
        if zakaznici[i]>max then begin
            max:=zakaznici[i];
            Str(i,id);
            maxS:=id;
        end
        else if zakaznici[i]=max then begin
            Str(i,id);
            maxS:=maxS+' ' + id;
        end;
    end;
    writeln('Najvacsiu sumu 3000 EUR zaplatili zakaznici c.: ', maxS);
    readln();
end.

