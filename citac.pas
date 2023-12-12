program ciselnik;
uses crt;

var     sub:file of byte;
        cislo,novecislo:byte;
        i,j,max:word;
begin
        clrscr;
        randomize;
        assign(sub, 'bytedat.dat');
        reset(sub);
        i:=0;
        max:=0;
        while not(eof(sub)) do begin
            inc(max);
            read(sub,cislo);
        end;
        repeat
            write('Zadaj poziciu ktoru chces zmenit od 1 do ',max);
            readln(j);    
        until (j <= max)and(j >= 1);
        
        write('Zadaj nove cislo od 0 po 255');
        readln(novecislo);      
        
        reset(sub);
        {moznost s for}
        for i:=1 to j-1 do read(sub,cislo);
        write(sub,novecislo);
        { moznost s while
        while not(eof(sub)) do begin
            inc(i);
            if i = j then write(sub,novecislo)
            else read(sub, cislo); 
        end;}
        {writeln('Zadaj cislo: ');
        readln(cislo);
        write(sub,cislo);
        for i := 1 to 1000 do begin
                cislo := Random(256);
                write(sub,cislo)
        end;  }
        close(sub);
        readln();
end.
