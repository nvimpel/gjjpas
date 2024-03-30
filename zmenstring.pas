program zmenpismenka;
uses crt;
var fileIn:text;
    slovoIn,slovoOut:string;
    c:char;
    l:byte;

begin
    readln();
    clrscr;

    assign(fileIn, 'slovo.txt');
    reset(fileIn);

    while not eof(fileIn) do begin
        slovoIn := '';
        read(fileIn, c);
        while not((c = ' ') or (c = chr(13)) or eof(fileIn)) do begin
            slovoIn := slovoIn + c;
            read(fileIn, c);
        end;
        l := length(slovoIn);
        slovoOut := slovoIn;
        if l >= 4 then begin
            slovoOut[2] := slovoIn[3]; slovoOut[3] := slovoIn[2];
        end;
        if l >= 6 then begin
            slovoOut[l-2] := slovoIn[l-1]; slovoOut[l-1] := slovoIn[l-2];
        end;
        write(slovoOut);
        write(c);
        
        if c = chr(13) then begin
            read(fileIn, c); write(c);
        end;
    end;
    readln();
    close(fileIn);
end.
    