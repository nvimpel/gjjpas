program kocka;
uses crt;

var per:byte;
    n,i:word;
    hody:array[1..6] of word;

begin
    randomize;
    clrscr;

    write('Zadaj pocet hodov kockou: ');
    readln(n);
    for i := 1 to 6 do hody[i] := 0;
    for i := 1 to n do begin
        per := Random(100)+1;
        case per of
            1..50: INC(hody[1]);
            51..89: INC(hody[2]);
            90..94: INC(hody[3]);
            95..97: INC(hody[4]);
            98..99: INC(hody[5]);
            100: INC(hody[6]);
        end;
    end;

    writeln('10 padla ',hody[1],' krat');
    writeln('20 padla ',hody[2],' krat');
    writeln('30 padla ',hody[3],' krat');
    writeln('50 padla ',hody[4],' krat');
    writeln('100 padla ',hody[5],' krat');
    writeln('1000 padla ',hody[6],' krat');    
    readln;
end.
{
10,20,30,50,100,1000
50,39,5,3,2,1
}