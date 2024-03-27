program runner;
uses crt;
var inputX,inputY,inputF:byte;

procedure OKNO(x,y,f:byte);
var i:byte;
begin
    TextColor(f);
    i:=0;
    repeat
        gotoxy(x+i,y);
        write('*');
        inc(i);
    until i=10;
    i:=1;
    repeat
        gotoxy(x,y+i);
        write('*');
        gotoxy(x+9,y+i);
        write('*');
        inc(i);
    until i=4;
    i:=0;
    repeat
        gotoxy(x+i,y+4);
        write('*');
        inc(i);
    until i=10;
end;
begin
    readln(inputX);
    readln(inputY);
    readln(inputF);
    OKNO(inputX,inputY,inputF);
    readln();
end.
