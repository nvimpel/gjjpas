program otacac;
uses crt;

var subIn,subOut:text;
    V,S:string;
    C:char;

function otoc(slovo:string):string;
var i,l:byte;
    tempS:string;

begin
    l := length(slovo);
    tempS[0]:=chr(l);
    for i:=1 to l do begin
        tempS[i]:=slovo[l-i+1];
    end;
    otoc:=tempS;
end;

begin
    readln();
    clrscr;
    assign(subIn, 'slovaIn.txt');
    assign(subOut, 'slovaOut.txt');
    reset(subIn);
    rewrite(subOut);
    writeln('check');
    readln();
    while(not(eof(subIn))) do begin
        S := '';
        V := '';
        repeat
            read(subIn, C);
            if((C <> ' ') AND (C <> '.')) then S:=S+C
            else if C = ' ' then begin V:=V+otoc(S)+' '; S:=''; end
            else if C = '.' then begin V:=V+otoc(S)+'.'; S:=''; end
        until (C = chr(13)) OR (eof(subIn));
        read(subIn, C); 
        writeln(V);
        writeln(subOut, V);

    end;
    readln();
    close(subIn);
    close(subOut);

end.
