program prevod;
uses crt;
var   inputType,i,j:byte;
        input:string[16];
        output:string[16];
        tempString:string[16];
        dek,n:word;


begin
repeat

    clrscr;
    inputType:=0;j := 0; dek:= 0; i:=0; n:=0;tempString:='';output:='';input:='';



    writeln('Zadaj cislo podla typu prevodu');
    writeln('1 BIN->DEC'); writeln('2 BIN->OCT'); writeln('3 BIN->HEX');
    writeln('4 DEC->BIN'); writeln('5 DEC->OCT'); writeln('6 DEC->HEX');
    writeln('7 END'); readln(inputType);
    clrscr;
    writeln('Zadaj vstupnu hodnotu');
    case inputType of
        1,2,3:readln(input);
        4,5,6:readln(dek);
    end;
    clrscr;
    case inputType of
        1:begin
            for i:=1 to length(input) do begin
                dek := dek * 2;
                dek := dek + ord(input[i])-48;
            end;
            writeln(dek, ' (dec)');
        end;
        2,3:begin
            if not((length(input)mod(inputType+1)) = 0) then j:= (inputType+1)-(length(input)mod(inputType+1));
            for i:=1 to length(input) do begin
                dek := dek * 2;
                dek := dek + ord(input[i])-48;
                inc(j);
                if(j = inputType + 1)or(i=length(input))  then begin
                    writeln('passed dek = ',dek, ' ', i div (inputType+1),' ', chr(dek + 48), ' ', length(input));
                    if(dek < 10) then output := output + chr(dek + 48)
                    else output := output+chr(dek + 55);
                    dek := 0;
                    j := 0;
                end;
            end;
            if inputType = 2 then writeln(output, ' (okt)');
            if inputType = 3 then writeln(output, ' (hex)');
        end;
        4,5,6:begin
            n:=dek;
            i:=0;
            repeat
                inc(i);
                output := output + chr((n mod 2)+48);
                n := n div 2;
            until n=0;
            for i:=1 to length(output) do begin
                tempString:=tempString+output[length(output)+1-i];
            end;
            if inputType > 4 then begin
                input := tempString;
                output:='';
                dek := 0;
                if not((length(input)mod(inputType-2)) = 0) then j:= (inputType-2)-(length(input)mod(inputType-2));
                for i:=1 to length(input) do begin
                    dek := dek * 2;
                    dek := dek + ord(input[i])-48;
                    inc(j);
                    if(j = inputType - 2)or(i=length(input))  then begin
                        if(dek < 10) then output := output + chr(dek + 48)
                        else output := output+chr(dek + 55);
                        dek := 0;
                        j := 0;
                    end;
                end;
            end;
            if inputType = 4 then writeln(output, ' (bin)');
            if inputType = 5 then writeln(output, ' (okt)');
            if inputType = 6 then writeln(output, ' (hex)');

        end;
    end;
    if not(inputType=7) then readln();

until inputType=7;
end.










