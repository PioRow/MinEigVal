function[] = test1()
% Projekt 2, Zadanie 39
% Piotr Rowicki, 320730

fprintf("Test sprawadzający funkcję SolveUpper\n");
fprintf("sprawdzana jest poprawność wyników. Dla kilku przykładowych\nmaciezrzy trójkątnych, górnych " + ...
    "i kilku wektorów\n  wyrazów wolnych rozwiąże ukłąd Ax=b gdzie A - macierz,\nb - wektor wyrazów wolnych " + ...
    "x - wyznaczane rozwiązanie.\nDla każdej z par macierz wektor przedstawi następnie wartość wyrażenia norm(Ax-b,2)\n" + ...
    " jako błąd i wskaźnik uwarunkowania macierzy Spodziewamy się że błąd będzie niewielki.\n") 
% definiowanie macierzy i wektorów wyrazów wolnych dla każdej z macierzy
B = [-3-2i 2-2i 9-3i 4+5i 2+6i;0 1+8i 4+5i 1+5i 6-3i;0 0 1+2i 2-2i -7+3i; 0 0 0 -4+4i 2+9i;0 0 0 0 11];
b1 = [8+3i;9+6i;7-1i;0+7i;2+1i];
b2 = [-6-8i;-4+3i;-7+6i;-7-1i;9];       
b3 = [7+6i;0;4+8i;9+5i;6-1i];
C = [2-4i -9+3i 6+5i -8-4i;0 -1-1i 4 -5+10i;0 0 12-5i 6+7i ;0 0 0 8-8i];
c1 = [-2i;1i;3+2i;0];
c2 = [9;2+2i;1+9i;7-2i];
c3 = [12+5i;5-8i;4+4i;12];
D = [3+2i -12+12i 5;0 5i 12;0 0 4i+8];
d1 = [6-6i;0.3+5i;6+3i];
d2 = [1;2i;6+4i];
d3 = [0;0;1i];
% wyznaczenie rozwiązań równań 
xb1 = SolveUpper(B,b1);
xb2 = SolveUpper(B,b2);
xb3 = SolveUpper(B,b3);
xc1 = SolveUpper(C,c1);
xc2 = SolveUpper(C,c2);
xc3 = SolveUpper(C,c3);
xd1 = SolveUpper(D,d1);
xd2 = SolveUpper(D,d2);
xd3 = SolveUpper(D,d3);
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
 
