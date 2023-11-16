program OprMatice;
uses crt;
const   xmax = 10;
        ymax = 10;
type    Tindex1=1..xmax;
        Tindex2=1..ymax;
        Tmatica=array[Tindex1,Tindex2] of integer;
var opt:char;

procedure menu();
begin
    writeln('1. Sucet matic');
    writeln('2. Rozdiel matic');
    writeln('3. Nasobenie matic skalarom');
    writeln('4. Nasobenie matic');
    writeln('5. Ukonci program');
end;

function Generuj(rx:Tindex1;ry:Tindex2;dh,hh:integer):Tmatica;
var     mat:Tmatica;
        kx:Tindex1;
        ky:Tindex2;
begin
        for ky := 1 to ry do
                for kx := 1 to rx do
                        mat[kx,ky]:=Random(hh-dh+1)+dh;
        Generuj:=mat;

end;

procedure Zobraz(M:Tmatica;rx:Tindex1;ry:Tindex2);
var     kx:Tindex1;
        ky:Tindex2;
begin
        for ky:=1 to ry do begin
                for kx:=1 to rx do
                        write(M[kx,ky]:10);
                writeln();
        end;
        writeln();
end;

procedure DefMaticu(var rx:Tindex1;var ry:Tindex2);
var tx,ty:byte;
begin  
    repeat
        writeln('Zadaj pocet stlpcov matice maximalne 10');
        readln(tx);
        writeln('Zadaj pocet riadkov matice maximalne 10');
        readln(ty);
        clrscr;
    until (tx <= 10) and (ty <= 10);
    rx := tx; ry := ty;
end;

procedure Interval(var dh,hh:integer);
var tdh,thh:integer;
begin
    repeat 
        writeln('Zadaj dolnu hranicu intervalu cisel.  Min -1000, Max 1000');
        readln(tdh);
        writeln('Zadaj hornu hranicu intervalu cisel.  Min -1000, Max 1000');
        readln(thh);
        clrscr;
    until (tdh>=-1000)and(thh<=1000)and(tdh<=thh);
    dh:=tdh; hh:=thh;
end;
{l-lokalne, p-pocitadlo, t-temp-docasne, o-moznost 1=plus 0=minus }
procedure PlusMinus(o:integer);
var lx,px:Tindex1;
    ly,py:Tindex2;
    mat1,mat2,mat3:Tmatica;
    ldh,lhh:integer;
begin
    Interval(ldh,lhh);
    DefMaticu(lx,ly);
    mat1 := Generuj(lx,ly,ldh,lhh);
    mat2 := Generuj(lx,ly,ldh,lhh);
    Zobraz(mat1,lx,ly);
    Zobraz(mat2,lx,ly);
    
    if o = 1 then
        for py := 1 to ly do
            for px := 1 to lx do
                mat3[px,py] := mat1[px,py] + mat2[px,py];
    if o = 0 then
        for py := 1 to ly do
            for px := 1 to lx do
                mat3[px,py] := mat1[px,py] - mat2[px,py];
    Zobraz(mat3,lx,ly);
    readln;
end;

procedure Skalar();
var lx,px:Tindex1;
    ly,py:Tindex2;
    mat1,mat2:Tmatica;
    skl:byte;
    ldh,lhh:integer;
begin
    Interval(ldh,lhh);
    DefMaticu(lx,ly);
    mat1 := Generuj(lx,ly,ldh,lhh);
    Zobraz(mat1,lx,ly);
    writeln();
    writeln('Zadaj velkost skalara, ktorym sa ma matica nasobit');
    readln(skl);
    for py := 1 to ly do
        for px := 1 to lx do
            mat2[px, py] := mat1[px,py] * skl;
    Zobraz(mat2,lx,ly);
    readln;
    
end;

procedure Nasobenie();
var lx1,lx2,px:Tindex1;
    ly1,ly2,py:Tindex2;
    i:byte;
    mat1,mat2,mat3:Tmatica;
    ldh,lhh:integer;
begin
    Interval(ldh,lhh);
    DefMaticu(lx1,ly1);
    mat1 := Generuj(lx1,ly1,ldh,lhh);
    writeln('1. matica:');
    Zobraz(mat1,lx1,ly1);
    readln();
    repeat
        clrscr;
        writeln('Pocet riadkov v druhej matici musi byt rovnaky ako pocet stlpcov v prvej matici (aktualne ',lx1,')');
        DefMaticu(lx2,ly2);
    until lx1 = ly2;
    mat2 := Generuj(lx2,ly2,ldh,lhh);
    writeln('2. matica:');
    Zobraz(mat2,lx2,ly2);
    readln();
    clrscr;
    
    Zobraz(mat1,lx1,ly1);
    Zobraz(mat2,lx2,ly2);
    for py := 1 to ly1 do
        for px := 1 to lx2 do begin
            mat3[px,py] := 0;
            for i := 1 to lx1 do 
                mat3[px,py] := mat3[px,py] + mat1[i,py] * mat2[px,i];    
        end;
    Zobraz(mat3, lx2, ly1);
    readln();
        
    
end;

begin
    randomize;
    clrscr;

    repeat
        cursoroff();
        clrscr;
        menu();
        opt := readkey;
        clrscr;
        cursoron;
        case opt of 
            '1':PlusMinus(1);
            '2':PlusMinus(0);
            '3':Skalar();
            '4':Nasobenie();
        end;
    until opt = '5';
    
end.
