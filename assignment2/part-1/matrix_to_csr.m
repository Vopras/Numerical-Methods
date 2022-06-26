function [values, colind, rowptr] = matrix_to_csr(A)
[m n] = size(A);
v = 1;
k = 0;
rowptr(1:m+1) = 0;
	for i = 1:m
		for j = 1:m
			if (A(i,j) != 0)
				values(v) = A(i,j);
				colind(v) = j;
				v++;
				k++;
				if (rowptr(i) == 0)
					for o = 1:v-1
						if (A(i,j) == values(o))
							rowptr(i) = o;
						end
					end
				end
			end
		end
	end
	rowptr(m+1) = k+1;
endfunction