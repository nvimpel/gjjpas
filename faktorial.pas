{pocitadlo faktiralu celeho cisla}
program faktorialTest;
uses crt;
var      v:byte;
         o:longint;

procedure fakt(x:byte;var y:longint);
var      i:byte;
         n:longint;
begin
        n:=1;
        for i:=x downto 2 do n:=n*i;
        y := n;
end;

begin
        clrscr;
        writeln('Zadaj cislo ktoreho faktorial chces vypocitat');
        readln(v);
        fakt(v,o);
        writeln('faktorial je ', o);
        readln();
end.