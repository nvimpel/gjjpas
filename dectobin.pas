program dectobin;
uses crt;

var bina,temp:string;
    dec,w:word;

begin
    readln(); {debug line}
    clrscr;

    write('Zadaj cele cislo z intervalu 0 az 65535: ');
    readln(dec);

    bina:='';
    w := dec;
    while w>0 do
    begin
        str(w mod 2,temp);
        bina:=temp+bina;
        w:=w div 2;
    end;

    write(dec, '(10)=',bina,'(2)');
    readln();
end.