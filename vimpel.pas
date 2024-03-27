program objektivnostKociek;
uses crt;

var c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,i,nHod:word;
    sucetHod:byte;

begin
        clrscr;
        randomize;
        c2 := 0;c3 := 0;c4 := 0;c5 := 0;c6 := 0;c7 := 0;c8 := 0;c9 := 0;c10 := 0;c11 := 0;c12 := 0;

        writeln('Zadajte pocet hodov oboma kockami.');
        readln(nHod);

        for i := 1 to nHod do begin
                sucetHod := (Random(6)+1) + (Random(6)+1);
                if sucetHod = 2 then INC(c2);
                if sucetHod = 3 then INC(c3);
                if sucetHod = 4 then INC(c4);
                if sucetHod = 5 then INC(c5);
                if sucetHod = 6 then INC(c6);
                if sucetHod = 7 then INC(c7);
                if sucetHod = 8 then INC(c8);
                if sucetHod = 9 then INC(c9);
                if sucetHod = 10 then INC(c10);
                if sucetHod = 11 then INC(c11);
                if sucetHod = 12 then INC(c12);




        end;

        writeln('Cislo 2 padlo ',c2,' krat');
        writeln('Cislo 3 padlo ',c3,' krat');
        writeln('Cislo 4 padlo ',c4,' krat');
        writeln('Cislo 5 padlo ',c5,' krat');
        writeln('Cislo 6 padlo ',c6,' krat');
        writeln('Cislo 7 padlo ',c7,' krat');
        writeln('Cislo 8 padlo ',c8,' krat');
        writeln('Cislo 9 padlo ',c9,' krat');
        writeln('Cislo 10 padlo ',c10,' krat');
        writeln('Cislo 11 padlo ',c11,' krat');
        writeln('Cislo 12 padlo ',c12,' krat');





        readln();


end.
