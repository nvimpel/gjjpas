{generuj 'okno' na zaklade parametrov uvedenych uzivatelom}
program okno;
uses crt;
var w,h:byte;

procedure okno(wh,hi:byte);
var x,y,i:byte;
begin
        x:=wherex;
        y:=wherey;
        i:=0;
        gotoxy(x,y);
        repeat
                write('+');
                inc(i);
        until i>=wh;
        i:=2;
        repeat
                gotoxy(x,y+i-1); write('+');
                gotoxy(x+wh-1,y+i-1); write('+');
                inc(i);
        until i>=hi;
        gotoxy(x,y+hi-1);
        i:=0;
        repeat
                write('+');
                inc(i);
        until i>=wh;

end;
begin
clrscr;
writeln('Zadaj vysku');
readln(h);
writeln('Zadaj sirku');
readln(w);
okno(w,h);
readln();
end.
