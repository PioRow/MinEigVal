function[x]  = SolveUpper(A,b)
% Projekt 2, Zadanie 39
% Piotr Rowicki, 320730
% funkcja rozwiązuje układ równań liniowych Ax=b gdzie A jest macierzą
% trójkątną, górną o wymiarach n na n nad ciałem liczb zespolonych
% Wejście:
%    A    - macierz trójkątna górna o wymiarach n na n nad ciałem liczb
%           zespolonych
%    b    - pionowy wektor wyrazów wolnych o wymiarach n na 1 nad ciałem 
%           liczb zespolonych
% Wyjście:
%    x    - pionowy wektor rozwiązania

% inicjalizacja zmiennych
n = length(b);
x = zeros(size(b)); 

% Wyznaczanie poszczególnych elementów wektora x
x(n) = b(n) / A(n,n);
for i = n-1 : -1 : 1
    x(i) = (b(i) - A(i,i+1:n) * x(i+1:n)) / A(i,i);
end

end % function