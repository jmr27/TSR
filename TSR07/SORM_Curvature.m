function[P,A,A11,V,k] = SORM_Curvature(alpha,Hess,norm_grad)
P = Gram_Schmidt_Process(alpha);
A = P*Hess*P'/norm_grad;
n = size(A,1);
A11 = A(1:n-1,1:n-1);
[V,D] = eig(A11);
k = D;
k1 = ['k1 = ',num2str(k(1,1))];
k2 = ['k2 = ',num2str(k(2,2))];
disp('Orthogonal Matrix (row vectors forming Orthonomal system to each other) with last row alpha :')
disp(P)
disp("Symmetric matrix A = PHP'/norm(grad_G at design point) : ")
disp(A)
disp("Partition matrix of A, A11 is (n-1)*(n-1) matrix :")
disp(A11)
disp("Transpose of orthonormal eigenmatrix : ")
disp(V')
disp("Curvature matrix : ")
disp(k)
disp(k1)
disp(k2)
end
