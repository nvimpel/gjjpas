program loteria;
uses crt;

var hrac:array[1..10] of byte;
    loto:array[1..20] of byte;
    i,j,spr:byte;
    input:byte;
    flag:boolean;



begin
    readln(); {debug line}
    clrscr;
    randomize;
    for i:= 1 to 20 do begin
        loto[i] := 0;
    end;
    writeln('Zadaj 10 cisel od 1 po 80 do loterie keno (oddeluj medzerou): ');
    readln(hrac[1],hrac[2],hrac[3],hrac[4],hrac[5],hrac[6],hrac[7],hrac[8],hrac[9],hrac[10]);
    for i:=1 to 20 do begin
        repeat
            flag := false;
            input := random(80)+1;
            for j:= 1 to i do begin
                if loto[j] = input then flag := true;
            end;
        until flag = false;
        loto[i] := input;
    end;
    write('Vyzrebovane cisla su: ');
    for i:=1 to 20 do begin
        write(loto[i],',');
    end;
    writeln();
    spr := 0;
    for i:=1 to 10 do begin
        for j:=1 to 20 do begin
            if hrac[i] = loto[j] then spr := spr + 1;
        end;
    end;

    writeln('Uhadol si ',spr,' cisla z 10');
    readln();    

end.