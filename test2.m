function[] = test2()
% Projekt 2, Zadanie 39
% Piotr Rowicki, 320730

fprintf("Test sprawadzający funkcję SolveLower\n");
fprintf("sprawdzana jest poprawność wyników. Dla kilku przykładowych\nmaciezrzy trójkątnych, dolnych " + ...
    "i kilku wektorów\n  wyrazów wolnych rozwiąże ukłąd Ax=bgdzie A - macierz,\nb - wektor wyrazów wolnych " + ...
    "x - wyznaczane rozwiązanie.\nDla każdej z par macierz wektor przedstawi w tabeli następnie wartość wyrażenia norm(Ax-b,2)\n" + ...
    " jako błąd i wskaźnik uwarunkowania macierzy.Spodziewamy się że błąd będzie niewielki.\n") 

% definiowanie macierzy i wektorów wyrazów wolnych dla każdej z macierzy
B = [-23+12i 0 0 0 0;3-12i 9-12i 0 0 0;9+12i 7-5i 1-2i 0 0;4-5i 5+5i 12+2i -4-4i 0;2+6i 6+3i 0 2-15i 1];
b1 = [15+12i;-23+16i;7-11i;10+7i;21+17i];
b2 = [-23-14i;-16+12i;17+6i;-7-10i;29];
b3 = [7+9i;0;14+8i;9+25i;6-11i];
C = [12+24i 0 0 0;-19-30i -21+12i 0 0;20-15i 34 30+25i 0;-18+24i -5-10i 16-17i 18+28i];
c1 = [-26i;19i;13+20i;0];
c2 = [19;22+23i;20+6i;17-28i];
c3 = [12+25i;35-18i;25+18i;30i];
D = [6-7i 0 0;-9-9i 0-85i 0;5 12 1-7i];
d1 = [62-61i;0.53+25i;66+23i];
d2 = [91;27i;62+48i];
d3 = [52;0;25i];
% wyznaczenie rozwiązań równań 
xb1 = SolveLower(B,b1);
xb2 = SolveLower(B,b2);
xb3 = SolveLower(B,b3);
xc1 = SolveLower(C,c1);
xc2 = SolveLower(C,c2);
xc3 = SolveLower(C,c3);
xd1 = SolveLower(D,d1);
xd2 = SolveLower(D,d2);
xd3 = SolveLower(D,d3);
fprintf("%7s|%22s|%25s|%10s\n","macierz","wektor wyrazów wolnych","wskaźnik uwarunkowania","błąd")
fprintf("%7s|%22s|%25.3e|%10.3e\n","B","b1",cond(B),norm(B*xb1-b1,2));
fprintf("%7s|%22s|%25.3e|%10.3e\n","B","b2",cond(B),norm(B*xb2-b2,2));
fprintf("%7s|%22s|%25.3e|%10.3e\n","B","b3",cond(B),norm(B*xb3-b3,2));
fprintf("%7s|%22s|%25.3e|%10.3e\n","C","c1",cond(C),norm(C*xc1-c1,2));
fprintf("%7s|%22s|%25.3e|%10.3e\n","C","c2",cond(C),norm(C*xc2-c2,2));
fprintf("%7s|%22s|%25.3e|%10.3e\n","C","c3",cond(C),norm(C*xc3-c3,2));
fprintf("%7s|%22s|%25.3e|%10.3e\n","D","d1",cond(D),norm(D*xd1-d1,2));
fprintf("%7s|%22s|%25.3e|%10.3e\n","D","d2",cond(D),norm(D*xd2-d2,2));
fprintf("%7s|%22s|%25.3e|%10.3e\n","D","d3",cond(D),norm(D*xd3-d3,2));
end
 
