{firma -mes vyplat listina v mzda.txt
struktura - v kaydom riadku jeden zamestnanec:
1. Rodne cislo, 2. ' ', 3. mzda
vypis v tvare R.c: rodne_cislo mzda 'EUR'
objem financii, min/max
priemerna mzda muz(0/1) a zena(5/6)
}
program mzdovac;
uses crt;

var     sub:text;
        min,max,mzda:word;
        n,nm,err:byte;
        rc:string[10];
        sum,summ:longint;
        avgo,avg:real;


begin
        clrscr;
        assign(sub,'mzda.txt');
        reset(sub);

        sum := 0; summ := 0; n := 0; nm := 0;
        readln();
        while not(eof(sub)) do begin
                readln(sub, rc, mzda);
                writeln('R.c: ', rc, ' ', mzda,' EUR');

                sum := sum + mzda;

                if n = 0 then begin
                        min := mzda;
                        max := mzda;
                end;
                inc(n);
                if mzda > max then max := mzda;
                if mzda < min then min := mzda;inc(n);

                if ((rc[3] = '0') OR (rc[3] = '1')) then begin
                        inc(nm);
                        summ := summ + mzda;
                end;

        end;

        writeln('Firma minula na mzdy ', sum, ' EUR');
        avg := sum / n;
        writeln('Priemerna mzda ',avg:0:2, ' EUR');
        writeln('Min/Max mzda = ', min,'EUR / ',max,'EUR');
        avgo := summ / nm;
        writeln('Priemerna mzda muzov: ', avgo:0:2, ' EUR');
        avgo := (sum - summ) / (n - nm);
        writeln('Priemerna mzda zien: ', avgo:0:2, ' EUR');



        close(sub);
        readln();
end.
