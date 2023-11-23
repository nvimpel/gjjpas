program zobrazovac;
uses crt;
var dn1,dn2,riadok,iRiad,iStlp,smer,maxRiad:byte;

begin
       clrscr;
       iRiad:=0;
       maxRiad := 29;
       dn1 := 1;
       dn2 := 30;
       smer := 1;
      while iStlp < 250 do begin
       while iRiad <= maxRiad+1 do begin
        if iRiad = dn1 then write('0')
        else if iRiad = dn2 then write('1')
        else begin
                if iRiad < maxRiad+1 then write(' ');
        end;
        INC(iRiad);
       end;
      writeln();
      INC(iStlp);
      iRiad := 0;
        if (smer = 1)AND(dn1 < maxRiad) then begin
                INC(dn1); DEC(dn2);
        end
        else if (smer = 1)AND(dn1 = maxRiad) then begin
                smer := 2; DEC(dn1); INC(dn2);
        end;
        if (smer = 2)AND(dn2 < maxRiad) then begin
                INC(dn2); DEC(dn1);
        end
        else if (smer = 2)AND(dn2 = maxRiad) then begin
                smer := 1; DEC(dn2); INC(dn1);
        end;
        {writeln('DEBUG', dn1,' ',dn2,' ',iRiad, ' ',iStlp, ' ',smer);}
      end;
       readln();
end.
