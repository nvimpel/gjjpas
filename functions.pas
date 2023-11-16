{Factorial function}
function fact(n:byte):longint;
var i:byte;f:longint;
begin
    f:=1;
    for i:=n downto 2 do f:=f*i;
    FAKT:=f;
end;

{MIN-MAX character procedure}
procedure minmax(s:string; b2:boolean; var c:char); {s- input string, b2- TRUE-max FALSE-min, c-returnable value aka. output char}
var      z:char; {Takes individual character from string}
         i:byte; {Counting variable}
begin
        z:=s[1];
        if b2=true then for i:=2 to length(s) do if s[i]>z then z:=s[i];
        if b2=false then for i:=2 to length(s) do if s[i]<z then z:=s[i];
        c:=z;
end;

{x to the power of y}
procedure x_na_y(x,y:integer; var z:longint); {x- input number, y- input variable, z-output value}
var i:integer; {Counting variable}
begin
    z := 1;
    for i:= 1 to y do z := z * x;
end;
