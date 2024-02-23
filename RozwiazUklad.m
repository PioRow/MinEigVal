function [x] = RozwiazUklad(P,L,U,b)
% Projekt 2, Zadanie 39
% Piotr Rowicki, 320730
%
% funkcja rozwiązuje układ równań liniowych Ax=b, gdzie gdzie macierz A
% jest dana jako elementy jej rozkładu PALU
% Wejście:
%    P    - pionowy wektor permutacji        
%    L    - macierz trójkątna dolna z jedynkami na diagonali, o elementach
%           zespolonych
%    U    - macierz trójkątna górna o elementach zespolonych
%    b    - pionowy wektor wyrazów wolnych, z ciała liczb zespolonych
% Wyjście:
%    x    - pionowy wektor rozwiązania


% wyznaczenie rozwiazania 
x = b(P);
x = SolveLower(L,x);
x = SolveUpper(U,x);

end

