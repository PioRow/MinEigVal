function [] = test7()
A = [1.05541975451926-0.815853017555874i -0.260678960190791+0.434734382890169i...
;-0.260678960190791+0.434734382890169i 1.22481921163827-1.09836054481722i];
xa0 = [2;1i];
B= [1-2.82842712474619i 0+6.66133814775094e-16i;0+8.88178419700125e-16i 1+3.87298334620742i];
xb0 = [3;7];

% najmniejsze i drugie najmniejsze wartosci wlasne macierzy
Eig1A =0.866025403784436-0.5i;
Eig2A = 1.41421356237309-1.41421356237309i;
Eig1B = 1-2.82842712474619i;
Eig2B = 1+3.87298334620742i;


% deklaracja wektorów przybliżeń i wektorów błędów przybliżeń
lambdasA = zeros(10,1);
errA = zeros(10,1);
errB = zeros(10,1);
errC = zeros(10,1);
lambdasB = zeros(10,1);
lambdasC = zeros(10,1);


% Wyznaczenie przybliżeń i ich błędów 
for i = 1 : 10
    lambdasA(i) = P2Z39_PRO_MinEigVal(A,xa0,9+i,0);% tolerancja 0, aby na pewno wykonały się iteracje
    lambdasB(i) = P2Z39_PRO_MinEigVal(B,xb0,9+i,0);
    lambdasC(i) = P2Z39_PRO_MinEigVal(A,[1+2i;7+3i],9+i,0);
    errA(i) = abs(lambdasA(i)-Eig1A);
    errB(i) = abs(lambdasB(i)-Eig1B);
    errC(i) = abs(lambdasC(i)-Eig1A);

end

for i=1:9
    errA(i+1)/errA(i)
    errC(i+1)/errC(i)
    errB(i+1)/errB(i)
end
