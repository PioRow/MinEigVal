function [x] = GEPP(A,b)%finished
% funkcja wyznacza rozwiazanie równania macierzowgo Ax=b
% stosujac eliminacje gausa z czesciowym wyborem;
n = length(b);
for  i = 1 : n - 1
    [~,k] =max(abs(A(i:n,i)));
    A([k+i-1,i],:)=A([i,k+i-1],:);
    b([k+i-1,i])=b([i,k+i-1]);
    W=A(i+1:n,i)./A(i,i);
    A(i+1:n,:)=A(i+1:n,:)-W.*A(i,:);
    b(i+1:n)=b(i+1:n)-W.*b(i); 
end

% rozwaiazanie układu równań z macierzą trójkątną
x=SolveUpper(A,b);
end

