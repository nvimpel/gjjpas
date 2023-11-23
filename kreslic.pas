program Kreslic;
uses crt;

procedure okno;
var x,y:byte;
begin
        x:=wherex;
        y:=wherey;
        gotoxy(x,y);
        write('**********');
        gotoxy(x,y+1);
        write('*        *');
        gotoxy(x,y+2);
        write('*        *');
        gotoxy(x,y+3);
        write('*        *');
        gotoxy(x,y+4);
        write('**********');
end;

begin
        clrscr;
        write('Hello world!');
        okno;
        readln();
end.