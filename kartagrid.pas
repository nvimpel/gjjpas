program OprMatice;
uses crt;
const   xmax = 10;
        ymax = 10;
type    Tindex1=1..xmax;
        Tindex2=1..ymax;
        Tmatica=array[Tindex1,Tindex2] of byte;
var     sub:text;
        i,j,x,y:byte;
        mat:Tmatica;

begin
        clrscr;
        randomize;
        assign(sub, 'gridtxt.txt');
        rewrite(sub);
        for i:= 1 to xmax do
                for j:= 1 to ymax do mat[i, j] := 0;

        for i:= 1 to 100 do begin
                repeat
                        x := random(10)+1;
                        y := random(10)+1;
                until mat[x,y] = 0;
                mat[x,y] := i;
        end;
        for i:= 1 to xmax do begin
                for j:= 1 to ymax do write(sub, mat[i,j]:4);
                writeln(sub);
        end;
        close(sub);
        readln();


end.
