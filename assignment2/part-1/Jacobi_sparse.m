function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
	
	[m n] = size(G_rowptr);
	x = zeros(1,n-1);

	x0 = x;

		while 1
			x = csr_multiplication(G_values, G_colind, G_rowptr, x0) + c;
			err = norm(x - x0);
			if (err < tol)
				return;
			end
			x0 = x;
		end

endfunction