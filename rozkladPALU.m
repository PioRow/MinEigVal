function [P,L,U] = rozkladPALU(A)
% Projekt 2, Zadanie 39
% Piotr Rowicki, 320730
% funkcja wyznacza rozkład kwadratowej,nieosobliwej macierzy A otrzymany 
% przez eliminacje Gausa z częściowym wyborem elementu głównego,
% czyli rozkład PALU
% Wejście:
%    A    - macierz której rozkładu szukamy
% Wyjście:
%    P    - pionowy wektor permutacji
%    L    - macierz trójkątna dolna z jedynakami na diagonali
%    U    - macierz trójkątna górna


% inicjalizacja zmiennych
n = size(A,1);
L = zeros(size(A));
P = 1:n;
P = P';

for i = 1 : n-1
    % częsciowy wybór elementu głównego i transpozycja wierszy
    [~,k] = max(abs(A(i:n,i)));
    L([i,k+i-1],:) = L([k+i-1,i],:);
    A([k+i-1,i],:) = A([i,k+i-1],:);
    P([i,k+i-1]) = P([k+i-1,i]);

    % Eliminacja Gausa dla i-tej kolumny
    Gamma = A(i+1:n,i) ./ A(i,i);
    L(i+1:n,i) = Gamma;
    A(i+1:n,:) = A(i+1:n,:) - Gamma .* A(i,:);

    % uzupełnienie diagonali L
    L(i,i) = 1;
end
L(n,n) = 1;

% przypisanie do U wynikowej macierzy trójkątnej górnej, otrzymanej prez
% GEPP
U = A;

end % function