program palindromer;
uses crt;
var  p,i,j,n:byte;
         s:string;
       tsAR,sAR:array[1..255] of string;
         l,h:byte;
         b:boolean;


begin
        clrscr;
        writeln('Zadaj vstup');
        readln(s);
        n:=0;
        p:=1;
        if not(s[Length(s)] = ' ') then  s := s + ' ';
        for i:=1 to Length(s) do begin
                if s[i] = ' ' then begin
                        inc(n);
                        sAR[n] := copy(s, p, i-p);

                        p := i+1;

                end;
        end;
        tsAr := sAr;
        for j:=1 to n do begin
            l := Length(tsAr[j]);
            h := l div 2;
            i := 1;
            b := true;
            tsAr[j] := lowercase(tsAr[j]);

            repeat
                if not(tsAr[j][i] = tsAr[j][l-i+1]) then begin
                        b := false;
                        i := h;
                end;
                inc(i);
            until i >h;
            if(b = true) then writeln(sAr[j], ' je palindrom')
            else writeln(sAr[j], ' nie je palindrom');

        end;
        readln();
end.