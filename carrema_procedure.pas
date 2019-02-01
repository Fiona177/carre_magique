program cm;

uses crt;

const ttab = 5;

TYPE tableau = array[1..ttab,1..ttab] of integer;



procedure initialisation(var t:tableau) ;
	var i,j : integer;

BEGIN
	for i:=1 to ttab do {initialise tout à 0}
	begin
		for j:=1 to ttab do
		t[i,j]:=0;
	end;
END;

procedure iniijnb(var i,j,nb :integer);

BEGIN
	j:= ttab-(ttab div 2); {on positionne j}
	i:= ttab div 2; {on positionne i}
	nb:=0;
END;


procedure affichage (var t:tableau);
	var i,j : integer;

BEGIN
	for i:=1 to ttab do {affiche le tableau}
	begin
		for j:=1 to ttab do
		begin
		TextBackground (cyan);
		TextColor (white);
		write('|');
		write(t[i,j]:5);
		end;
	write('|');
	writeln;
	end;
END;

procedure deroulement(var t:tableau; n,x,y:integer);
	var anci, ancj :integer;

BEGIN
	while n<>ttab*ttab do {tant que n est different de la taille du tableau * la taille du tableau on fait :}
	begin
	n:=n+1; {incremente n par 1}
	t[x,y]:=n; {la cellule prend nb}
	ancj:=y;
	y:=y+1; {on deplace y de +1}

	if (y>ttab) then y:=1; {si y est superieur a la taille du tableau alors il revient au debut}

	anci:=x;
	x:=x-1; {on deplace x de -1}

	if (x<1) then x:=ttab; {si x est inferieur a 1 alors il va au bord du tableau}
	if t[x,y] <> 0 then {si la cellule est prise}
		begin
		x:= anci-2; {alors on deplace x de -2}
		if (x<1) then x:=ttab+x; {si x est inferieur a 1 alors on le deplace a la taille du tableau + x}
		y:=ancj;
        end;
	end;
END;


var tcarre : tableau;
	i,j,nb,anci,ancj : integer;

BEGIN
    clrscr;
    initialisation(tcarre);

	iniijnb(i,j,nb);

	deroulement(tcarre,nb,i,j);

	affichage(tcarre);

    readln;
END.
