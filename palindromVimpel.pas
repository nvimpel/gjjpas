program palindrom;
uses crt;

var         s:String;
        l,n,i:Byte;
            b:boolean;
begin
        clrscr;
        writeln('Zadaj slovo');
        readln(s);
        l := Length(s);
        n := (l div 2);

        i:=1;
        b:=true;
        repeat
                if not(s[i] = s[l-i+1]) then begin
                        b := false;
                        i := n;
                end;
                inc(i);
        until i >= n;

        if b=true then writeln(s,' je palindrom')
        else writeln(s, ' nie je palindrom');
        readln();
end.