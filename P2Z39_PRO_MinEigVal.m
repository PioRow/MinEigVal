function [lambda,It,err] = P2Z39_PRO_MinEigVal(A,x,MaxIt,tol)
% Projekt 2, Zadanie 39
% Piotr Rowicki, 320730
%
% Wyznaczenie najmniejszej, co do modułu, wartości własnej nieosobliwej,
% kwadratowej macierzy A nad ciałem liczb zespolonych o wymiarach n na n.
% stosując odwrotną metodę potęgową z normowaniem. Do normowania posłuży
% nam norma druga, a do rozwiązywania układów równań, rozkład macierzy A 
% otrzymany metodą eliminacju Gaussa z częsciowym wyborem
% Wejscie :
%   A      - kwadratowa, nieosobliwa macierz kwadratowa nad ciałem liczb
%            zespolonych o wymiarach n na n
%   x      - pionowy niezerowy wektor przybliżenia początkowego o wymiarze
%            n (domyślnie wektor losowy)  
%               
%  MaxIt   - maksymalna ilość iteracji wykonywanych przez funkcję 
%            (domyślnie 500)
%   tol    - maksymalna tolerancja błędu (domyślnie 1e-9)
% Wyjście:
%  lambda  - przybliżenie najmniejszej co do modułu wartości własniej
%            macierzy A
%   It     - ilość wykonanych iteracji(jeżeli nie uzyskamy żądanej
%            dokładności, zwraca MaxIt+1)
%   Err    - błąd przybliżenia(jeżeli jest większy niż eps, nie
%            osiągneliśmny żądanej dokładności)

% Ustawienie argumentów domyślnych
if nargin <= 3
    tol=1e-9;
end
if nargin <= 2
    MaxIt = 500;
end
if nargin <= 1
    x = rand(size(A,1),1) + rand(size(A,1),1) .*1i;
end

% implementacja Metody

% wyznaczenie normy wektora początkowego, inicjalizacja początkowego
% przybliżenia lambdy
norma = norm(x,2);
lambda = 0;

% wyznaczenie rozkładu macierzy 
[P,L,U] = rozkladPALU(A);

for It = 1 : MaxIt
    % zapamiętanie w k-tej iteracji (k-1) przybliżenia lambdy 
    lambdaprev = lambda;

    % wyliczenie znormowanego wektora poprzedniej iteracji
    xprev = x ./ norma;
    
    % wyznaczenie kolejnego przybliżenia wek.wł. x, po przez rozwiązanie
    % liniowego układu równań A * x(k) = x(k-1) / ||x(k-1)||2, korzystając 
    % z rozkładu PALU
    x = RozwiazUklad(P,L,U,xprev);
    
    % wyznaczenie normy wektora x
    norma = norm(x,2);
   
    % wyliczenie przybliżenia wartości własnej, korzystając z faktu że
    % A * x(k+1) = lambda*x(k),i x(k-1) / ||x(k-1)||2 = A * x(k+1) 
    lambda = (x' * xprev) / norma ^ 2;

    % sprawdzenie warunku stopu
    err = norm(lambdaprev .*x  -xprev,2);
    if err < tol
        break
    end
end

% zasygnalizowanie, że metoda nie osiągneła zadanej dokładności w żądnej
% ilości iteracji
if err >= tol
    It = MaxIt + 1;
end

end % function