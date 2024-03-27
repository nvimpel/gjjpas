program prettyfier;
uses crt;

var subIn,SubOutM,subOutW:Text;
    sText,sLast:string;
    fileName,fileOutName:string;
    c:char;
    b:boolean;
begin
    assign(subIn,'names.txt');
    assign(SubOutM,'namesM.txt');
    assign(subOutW,'namesW.txt');
    reset(subIn);
    rewrite(SubOutM);
    rewrite(subOutW);

    {while not eof(subIn) do
    begin
        readln(subIn,sText);
        c:=sText[length(sText)];
        case c of 
            'a':sText:=COPY(sText, 1, length(sText) - 1)+'ova';
            'b':sText:=sText+'ova';
            'c':begin
                if sText[length(sText)-2] in ['m','b','v','n'] then 
                    sText:=COPY(sText, 1, length(sText) - 2)+'cova'
                else
                    sText:=sText+'ova';
                end;            
            'd'..'n':sText:=sText+'ova';
            'o':sText:=sText+'va';
            'p'..'t':sText:=sText+'ova';
            'v':sText:=sText+'ova';
            'y':begin
                if sText[length(sText)-1] in ['k','n','l'] then
                    sText:=COPY(sText, 1, length(sText) - 1)+'a'
                else if sText[length(sText)-1] in ['c','t','b','r'] then
                    sText:=COPY(sText, 1, length(sText) - 1)+'ova'
                else
                    sText:=sText+'ova';
                end;
            'z':sText:=sText+'ova';
        end;
        writeln(SubOut,sText);
    end;}
    while not eof(subIn) do
    begin
        readln(subIn,sText);
        c:=sText[length(sText)];
        if c='a' then writeln(SubOutW,sText)
        else writeln(SubOutM,sText);
    end;
    

    {writeln('Write name: ');
    readln(sText);
    sText:=COPY(sText, 1, length(sText) - 1)+'ova';
    writeln(sText);
    readln;}
    close(SubOutM);
    close(SubOutW);
    close(subIn);

end.