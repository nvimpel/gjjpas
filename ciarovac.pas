{program nakresli ciari s nahodou dlzkou a farbou rozne po obrazovke az po kym nioe je stlacena klavesa}
program ciarovac;
uses crt;
var a,b,c,f:integer;
procedure UrobCiaru(x,y,dlzka,c:integer);
var i:integer;
begin
        gotoxy(x,y);
        textcolor(c);
        for i:=1 to dlzka do write('-');
end;
begin
        clrscr;
        cursoroff;

        {readln(a);
        readln(b);
        readln(c);}
        randomize();

        repeat
        a:=Random(150)+1;
        b:=Random(25)+1;
        c:=Random(10)+1;
        f:=Random(16);
        UrobCiaru(a,b,c,f);
        delay(1);
        until keypressed;
        cursoron;
        readln();
end.
