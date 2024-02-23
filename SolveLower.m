function[x] = SolveLower(A,b)
% Projekt 2, Zadanie 39
% Piotr Rowicki, 320730
% funkcja rozwiązuje układ równań liniowych Ax=b gdzie A jest macierzą,
% trójkątną dolną o wymiarach n na n.
% Wejście:
%    A    - macierz trójkątna, dolna o wymiarach n na n nad ciałem liczb
%           zespolonych
%    b    - pionowy wektor wyrazów wolnych o wymiarach n na 1 nad ciałem 
%           liczb zespolonych
% Wyjście:
%    x    - pionowy  wektor rozwiązania

% inicjalizacja zmiennych
x = zeros(size(b));
n = length(b);

% Wyznaczanie poszczególnych elementów wektora x
x(1) = b(1) ./ A(1,1);
for i = 2 : n 
    x(i) = (b(i) - A(i,1:i-1) * x(1:i-1)) / (A(i,i));
end

end % function