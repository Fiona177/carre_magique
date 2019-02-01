program cm;

uses crt;

const ttab = 5;
var tcarre:array[1..ttab,1..ttab] of integer;
	i,j,nb,anci,ancj : integer;

BEGIN
        clrscr;

	for i:=1 to ttab do {initialise tout à 0}
	begin
		for j:=1 to ttab do
		tcarre[i,j]:=0;
	end;

	j:= ttab-(ttab div 2); {on positionne j}
	i:= ttab div 2; {on positionne i}
	nb:=0;

	while nb<>ttab*ttab do {tant que nb est different de la taille du tableau * la taille du tableau on fait :}
	begin
	nb:=nb+1; {incremente nb par 1}
	tcarre[i,j]:=nb; {la cellule prend nb}
	ancj:=j;
	j:=j+1; {on deplace j de +1}

	if (j>ttab) then j:=1; {si j est superieur a la taille du tableau alors il revient au debut}

	anci:=i;
	i:=i-1; {on deplace i de -1}

	if (i<1) then i:=ttab; {si i est inferieur a 1 alors il va au bord du tableau}

	if tcarre[i,j] <> 0 then {si la cellule est prise}
		begin
		i:= anci-2; {alors on deplace i de -2}
		if (i<1) then i:=ttab+i; {si i est inferieur a 1 alors on le deplace a la taille du tableau + i}
		j:=ancj;
        end;
	end; 


	for i:=1 to ttab do {affiche le tableau}
	begin
		for j:=1 to ttab do
		begin
		TextBackground (white);
		TextColor (red);
		write('|');
		write(tcarre[i,j]:5);
		end;
	write('|');
	writeln;
	end;
        readln;
END.
