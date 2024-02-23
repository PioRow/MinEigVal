function[] = test3()
% Projekt 2, Zadanie 39
% Piotr Rowicki, 320730
fprintf("test funkcji rozkładu PALU\n");
fprintf("Dla kilku przykładowych macierzy nieosobliwych, wyznaczony zostanie ten rozkład,\na następnie," + ...
    " w tabeli, zostanie przedstawiona,dla każdej z tych macierzy \n" + ...
    "wartość wyrażenia norm(P*A-L*U,2) gdzie A to jedna z macierzy a P, L i U \n" + ...
    "to elementy jej rozkładu i wskaźnik uwarunkowania A.Spodziewamy się małych wartości błędu\n")
% definicja macierzy
A = [1+1i 4+4i 8+2i 8+4i 1+1i;8+8i 1 8+4i 4+4i 1+7i;5+6i 9+2i 0 9+3i 8+3i;9+3i 0+1i 3+9i 1+9i 5+2i;0+5i 7+1i 2+9i 2+3i 5+4i];
B = [81+71i 29+24i 33+13i 16+83i 67+75i;54+96i 49+24i 89+13i 16+94i 84+33i;...
   96+51i 69+47i 14+29i 16+40i 80+50i;7+31i 21+62i 11+74i 9+6i 72+23i;55+79i 61+62i 96+42i 46+58i 48+94i];

C = [0.8+0.7i 0+0.7i 0.1+0.8i 0.1+0.4i 0.6+0.4i;0.9+0.7i 0.2 0.9+0.6i 0.4+0.3i 0+0.4i...
    ;0.1+0.3i 0.5+0.2i 0.9+0.3i 0.9+0.7i 0.8+0.6i;0.9+0.6i 0.9 0.4+0.9i 0.7+0.7i 0.9+0.7i;0.6+0.1i 0.9 0.8 0.9+0.1i 0.6+0.7i];
D = [27+54i 11+84i 58+92i 50+61i;67+13i 49+25i 22+34i 69+47i;65+14i 95+81i 75+19i 89+35i;16+25i 34+24i 25+25i 95+83i];
E = [0.5 0.7+0.3i 0+0.2i 0.9+0.4i;0.5+0.3i 0.7+0.5i 0+0.6i 0.1;0.9+0.1i 0.3+0.1i 0.5+0.6i 0.5+0.2i;0.2+0.7i 0.5+0.6i 0.7+0.7i 0.4+0.9i];


% wyznacznie rozkładów dla każdej z macierzy
[Pa,La,Ua] = rozkladPALU(A);
[Pb,Lb,Ub] = rozkladPALU(B);
[Pc,Lc,Uc] = rozkladPALU(C);
[Pd,Ld,Ud] = rozkladPALU(D);
[Pe,Le,Ue] = rozkladPALU(E);

fprintf("%9s|%25s|%22s\n","macierz","wskaźnik uwarunkowania","wartość wyrażenia norm(P*A-L*U,2)");
fprintf("%9s|%25.5e|%22.5e\n","A",cond(A),norm(A(Pa,:)-La*Ua,2));
fprintf("%9s|%25.5e|%22.5e\n","B",cond(B),norm(B(Pb,:)-Lb*Ub,2));
fprintf("%9s|%25.5e|%22.5e\n","C",cond(C),norm(C(Pc,:)-Lc*Uc,2));
fprintf("%9s|%25.5e|%22.5e\n","D",cond(D),norm(D(Pd,:)-Ld*Ud,2));
fprintf("%9s|%25.5e|%22.5e\n","E",cond(E),norm(E(Pe,:)-Le*Ue,2));


end
