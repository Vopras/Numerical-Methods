function x = SST(A, b)
[n m] = size(A);
x = zeros(n, 1);
q = 0;
for i = n:-1:1
	for k = i+1:1:n
		q = q + (A(i,k) * x(k));
	endfor
	
	x(i) = b(i) - q;
endfor
endfunction