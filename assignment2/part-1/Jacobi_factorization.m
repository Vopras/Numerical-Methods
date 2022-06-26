function [G_J, c_J] = Jacobi_factorization(A, b)

[m n] = size(A);
c = min(m,n);
A;
L = zeros(m,n);
U = zeros(m,n);

	for i = 1:c
		D(i,i) = A(i,i);
	end;
D;
	for i = 2:c
		for j = 1:i-1
			L(i,j) = A(i,j);
		end
	end
L;


	for i = 1:c-1
		for j = i+1:n
			U(i,j) = A(i,j);
		end
	end
U;

	G_J = inv(D) * (D - A);
	c_J = inv(D) * b;

endfunction