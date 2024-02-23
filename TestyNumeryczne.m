function [Itneededmin,Itneededmax] = TestyNumeryczne()
rng(217);
A=rand(100)+rand(100).*1i;
X=rand(100)+rand(100).*1i;

results = zeros(100,3);
for i=1:100
   % [results(i,1),results(i,2),results(i,3)]=P2Z39_PRO_MinEigVal(A,X(:,i));
    
end
vectornr = 1:100;
figure;
hold on
grid on
plot(vectornr,results(:,2),'.','LineWidth',0.25)
xlabel("numer losowego wektora")
ylabel("liczba wykonanych iteracji")

Itneededmin=zeros(9,1);
Itneededmax=zeros(9,1);
for j=1:9

    [~,Itneededmin(j),~]=P2Z39_PRO_MinEigVal(A,X(:,34),1000,10^(-j-5));
     [~,Itneededmax(j),~]=P2Z39_PRO_MinEigVal(A,X(:,99),1000,10^(-j-5));
     
end

    