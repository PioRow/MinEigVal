function [] = test4()
% Projekt 2, Zadanie 39
% Piotr Rowicki, 320730
fprintf("test funkcji RozwiazUklad");
fprintf("dla kilku przykładowych macierzy nieosobliwych, zespolonych\n" + ...
    "i dla kilku wektorów wrazów wolnych, zostanie wyznaczone roziwazanie układu\n" + ...
    "Ax=b, gdzie: A- macierz,b-wektor wyrazów wolnych, x-wyznaczone rozwiązanie, \n" + ...
    "wyznaczając wcześniej rozkład PALU tejże macierzy, przetestowaną już metodą\n" + ...
    "następnie, w tabeli, przedstawiona zostanie wartość wyrażenia norm(A*x-b,2) jako błąd\n" + ...
    "bezwzględny, wskaźnik uwarunkowania A oraz wartośc wyrażenia bład/cond(A)/eps.\n Spodziewamy się że wartość błędu będzie niewielka.\n")
% definiowanie macierzy, i wektorów wyrazów wolnych;
A = [5+2i 6+4i 8+7i;4+8i 6+1i 5+5i;9 8+9i 1+4i];
B = [0+4i 3+6i 9+1i 2;9+9i 1+5i 9+1i 4+5i;1+3i 4+6i 0+9i 5+8i;1+7i 3+6i 7+1i 9+6i];
C = [2+1i 12+8i 7+2i 8+10i 12+4i;5+13i 9 1+6i 3+10i 14+7i;6+13i 5+6i 8+1i 4+9i 10+9i;...
    14+12i 2+4i 3+8i 9 5+6i;2+3i 6+2i 5+7i 3+1i 8+12i];
a1 = [6+7i;9+2i;2+1i];
a2 = [6+6i;4+7i;4+3i];
a3 = [6+8i;4+2i;8+6i];
b1 = [4+4i;0+1i;1+3i;7+6i];
b2 = [1+2i;7+7i;2+1i;9+2i];
b3 = [0+4i;5+6i;6+6i;5+6i];
c1 = [5+1i;5+9i;8+6i;2+4i;3+6i];
c2 = [5+9i;6+2i;5+1i;7+1i;5]; 
c3 = [4+7i;4+9i;3+9i;7+1i;6+1i];
% wyznaczenie rozkładów macierzy
[Pa,La,Ua] = rozkladPALU(A);
[Pb,Lb,Ub] = rozkladPALU(B);
[Pc,Lc,Uc] = rozkladPALU(C);

% wyznaczenie rozwiązań układu
xa1 = RozwiazUklad(Pa,La,Ua,a1);
xa2 = RozwiazUklad(Pa,La,Ua,a2);
xa3 = RozwiazUklad(Pa,La,Ua,a3);
xb1 = RozwiazUklad(Pb,Lb,Ub,b1);
xb2 = RozwiazUklad(Pb,Lb,Ub,b2);
xb3 = RozwiazUklad(Pb,Lb,Ub,b3);
xc1 = RozwiazUklad(Pc,Lc,Uc,c1);
xc2 = RozwiazUklad(Pc,Lc,Uc,c2);
xc3 = RozwiazUklad(Pc,Lc,Uc,c3);
fprintf("%7s|%12s|%25s|%10s|%13s\n","macierz","wek.wyr.wol.","wsk.uwar.","błąd bwzgl","błąd/cond/eps")
fprintf("%7s|%12s|%25.3e|%10.3e|%13.3e\n","A","a1",cond(A),norm(A*xa1-a1,2),norm(A*xa1-a1,2)/cond(A)/eps);
fprintf("%7s|%12s|%25.3e|%10.3e|%13.3e\n","A","a2",cond(A),norm(A*xa2-a2,2),norm(A*xa2-a2,2)/cond(A)/eps);
fprintf("%7s|%12s|%25.3e|%10.3e|%13.3e\n","A","a3",cond(A),norm(A*xa3-a3,2),norm(B*xb1-b1,2)/cond(A)/eps);
fprintf("%7s|%12s|%25.3e|%10.3e|%13.3e\n","B","b1",cond(B),norm(B*xb1-b1,2),norm(B*xb1-b1,2)/cond(B)/eps);
fprintf("%7s|%12s|%25.3e|%10.3e|%13.3e\n","B","b2",cond(B),norm(B*xb2-b2,2),norm(B*xb2-b2,2)/cond(B)/eps);
fprintf("%7s|%12s|%25.3e|%10.3e|%13.3e\n","B","b3",cond(B),norm(B*xb3-b3,2),norm(B*xb3-b3,2)/cond(B)/eps);
fprintf("%7s|%12s|%25.3e|%10.3e|%13.3e\n","C","c1",cond(C),norm(C*xc1-c1,2),norm(C*xc1-c1,2)/cond(C)/eps);
fprintf("%7s|%12s|%25.3e|%10.3e|%13.3e\n","C","c2",cond(C),norm(C*xc2-c2,2),norm(C*xc2-c2,2)/cond(C)/eps);
fprintf("%7s|%12s|%25.3e|%10.3e|%13.3e\n","C","c3",cond(C),norm(C*xc3-c3,2),norm(C*xc3-c3,2)/cond(C)/eps);


end

