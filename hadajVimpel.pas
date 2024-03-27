program hadaj_cislo;
uses crt;
var n,hraj,PCnum,Tip:byte;
    vyhra:boolean;
begin
       randomize;
       hraj := 1;
       while(hraj <> 0) do begin
        clrscr;
        vyhra := false;
        n:=0;Tip:=0;
        PCnum := Random(100) + 1;
        while Tip <> PCnum do begin
                INC(n);
                writeln('Ake cislo od 1 do 100 si myslim? ');
                readln(Tip);
                if (Tip < PCnum) then writeln('Neuhadol si, myslim si vacsie cislo');
                if (Tip > PCnum) then writeln('Neuhadol si, myslim si mensie cislo');
        end;
        writeln('Uhadol si. Pocet pokusov = ', n);
        writeln('Ak uz nechces hrat zadaj 0');
        readln(hraj);
       end;
end.