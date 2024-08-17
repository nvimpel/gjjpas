program sifrovanie;
uses crt;

var input:string;
    fileIn:text;
    err:integer;
    code:integer;
    c:char;
    i:byte;

begin
    readln();
    clrscr();

    assign(fileIn, 'inputtext.txt');
    reset(fileIn);
    readln(fileIn, input);
    i:=1;
    while not eof(fileIn) do begin
        read(fileIn, c);
        if (c >= 'a')and(c <= 'z') then begin
            val(input[i], code, err);
            c := chr(ord(c) - code);
            if c < 'a' then c := chr(ord(c) + 26);
            i := i + 1;
            if i > (length(input) - 1) then i := 1;
        end;
        write(c);
    end;
    readln();
    close(fileIn);
end.