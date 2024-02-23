function [] = test5()
% Projekt 2, Zadanie 39
% Piotr Rowicki, 320730
fprintf("test zbieżności głównej\n")
fprintf("dla kilku par macierzy i wektorów początkowych, spełniających\n" + ...
    "wymagania zbieżności, przybliżona zostanie najniejsza wartość własna,z\nmaksymalną" + ...
    "liczbą iteracji 500 i tolerancjami  1e-8,1e-9 i 1e-10. W tabeli zostanie\nprzedstawiona zadana toleranjca" + ...
    " przybliżona wartość własna, bezwględny błąd przybliżenia,\nwartości własnej,oszczcowanie błędu wyznaczone przez funkjce," + ...
    "ilość wykonanych iteracji oraz\n" + ...
    "przewidywana liczba iteracji, wynikająca z analizy" + ...
    "ilorazu abs(lambda_n/lmabda_(n-1))\ngdzie lambda_n i lambda_(n-1) to kolejno najmniejsza" + ...
    " i druga najmniejsza wartość własna danej macierzy.\n" + ...
    "Spodizewamy się że przybliżenie błędu bedzie mniejsze niż tolerancja, błąd bezwględny\n" + ...
    "odpowniednio mały a liczba iteracji zbliżona do przewidywanej\n")
% definiowanie macierzy i przybliżeń początkowych
A = [1.05541975451926-0.815853017555874i -0.260678960190791+0.434734382890169i...
;-0.260678960190791+0.434734382890169i 1.22481921163827-1.09836054481722i];
xa0 = [2;1i];
B= [1-2.82842712474619i 0+6.66133814775094e-16i;0+8.88178419700125e-16i 1+3.87298334620742i];
xb0 = [3;7];
% najmniejsze  wartości własne 
smallestEigA = sqrt(3)/2 - 1/2*1i;
smallestEigB = 1-sqrt(8)*1i;

% przewidywane ilości iteracji, wyliczone jako k, gidze
% abs(lambda_n/lmabda_(n-1))^k<=1e-9
Aexpit8 = 27; 
Bexpit8 = 65;
Aexpit9 = 30; 
Bexpit9 = 73;
Aexpit10 = 34; 
Bexpit10 = 81;
% wywołanie funkjci głównej
[Beig8,Bit8,Berr8] =P2Z39_PRO_MinEigVal(B,xb0,500,1e-8);
[Aeig8,Ait8,Aerr8] =P2Z39_PRO_MinEigVal(A,xa0,500,1e-8);
[Beig9,Bit9,Berr9] =P2Z39_PRO_MinEigVal(B,xb0,500,1e-9);
[Aeig9,Ait9,Aerr9] =P2Z39_PRO_MinEigVal(A,xa0,500,1e-9);

[Beig10,Bit10,Berr10] =P2Z39_PRO_MinEigVal(B,xb0,500,1e-10);
[Aeig10,Ait10,Aerr10] =P2Z39_PRO_MinEigVal(A,xa0,500,1e-10);

fprintf("%5s|%7s|%19s|%10s|%10s|%11s|%s\n","tol","macierz","przyb. w.w","błąd bwzgl","osz. bł.","iteracje","przew.il.it")
fprintf("%5.0e|%7s|%6.2e %6.2ei|%10.3e|%10.3e|%11d|%d\n",1e-8,"A",real(Aeig8),imag(Aeig8),abs(Aeig8-smallestEigA),Aerr8,Ait8,Aexpit8);
fprintf("%5.0e|%7s|%6.2e %6.2ei|%10.3e|%10.3e|%11d|%d\n",1e-9,"A",real(Aeig9),imag(Aeig9),abs(Aeig9-smallestEigA),Aerr9,Ait9,Aexpit9);
fprintf("%5.0e|%7s|%6.2e %6.2ei|%10.3e|%10.3e|%11d|%d\n",1e-10,"A",real(Aeig10),imag(Aeig10),abs(Aeig10-smallestEigA),Aerr10,Ait10,Aexpit10);
fprintf("%5.0e|%7s|%6.2e %6.2ei|%10.3e|%10.3e|%11d|%d\n",1e-8,"B",real(Beig8),imag(Beig8),abs(Beig8-smallestEigB),Berr8,Bit8,Bexpit8);
fprintf("%5.0e|%7s|%6.2e %6.2ei|%10.3e|%10.3e|%11d|%d\n",1e-9,"B",real(Beig9),imag(Beig9),abs(Beig9-smallestEigB),Berr9,Bit9,Bexpit9);
fprintf("%5.0e|%7s|%6.2e %6.2ei|%10.3e|%10.3e|%11d|%d\n",1e-10,"B",real(Beig10),imag(Beig10),abs(Beig10-smallestEigB),Berr10,Bit10,Bexpit10);






