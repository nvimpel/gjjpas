{otoc string a 'volitelne/ treba odpoznamkovat' pracuj v suboroch}
program otacac;
uses crt;

var subIn,subOut:text;
    S:string;

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
    clrscr;
    assign(subIn, 'slovaO.txt');
    {assign(subOut, 'slovaO.txt');}
    reset(subIn);
    {rewrite(subOut);}
    {while(not(eof(subIn))) do begin
        readln(subIn, S);
        writeln(S);
    end;}
    reset(subIn);
    while(not(eof(subIn))) do begin
        readln(subIn, S);
        writeln(otoc(S));
    end; 
    readln();
    close(subIn);
    {close(subOut);}

end.
