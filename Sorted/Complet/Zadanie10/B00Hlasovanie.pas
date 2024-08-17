program hlasuj;
uses crt;

var stat:Array[6930..6939] of word;
    min,inpt,i:word;
    fileIn:text;


begin
    clrscr;
    for i:=6930 to 6939 do stat[i] := 0;
    assign(fileIn, 'hlasy.txt');
    reset(fileIn);
    while not(eof(fileIn)) do begin
        readln(fileIn,inpt);
        INC(stat[inpt])
    end;

    min := 6930;
    for i:=6931 to 6939 do begin
        if stat[i] < min then min := i;
    end;

    for i:=6930 to 6939 do writeln('Sutaziaci ', i, ' ziskal ', stat[i], ' hlasov');
    writeln('Najmenej hlasov ziskal sutaziaci ', min ,' pocet hlasov: ', stat[min]);
    readln();
    close(fileIn);
end.