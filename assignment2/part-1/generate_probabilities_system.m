function [A, b] = generate_probabilities_system(rows)

nn = 0;

	for j = 1:rows;
		nn = nn + j;
	endfor
nn;

	b = zeros(1,nn);
	b(nn-rows+1:nn) = 1;
	b = b';%'
b;
	
k = 1;
	for i = 1:rows
		for j = 1:i
			M(i,j) = k;
			k++
		end
	end
M

P = zeros(nn);

k = 0;
	for i = 1:rows
		for j = 1:i
			k++;
			if (M(i,j) == 1)
				P(i,j) = 4;
				P(i,j+1:j+2) = -1;
			elseif ((M(i,j) == nn - rows +1) || (M(i,j) == nn))
				P(k,k) = 4;
				if 	(j == 1)
					P(k,k+1) = -1;
					P(k,k-rows+1) = -1;
				else
					P(k,k-1) = -1;
					P(k,k-rows) = -1;
				end
			elseif ((j == 1) || (i == j))
				P(k,k) = 5;
				if (j == 1) 
					P(k,k-i+1) = -1;
					P(k,k+1) = -1;
					P(k,k+i) = -1;
					P(k,k+i+1) = -1;
				end
				if (i == j)
					P(k,k-i) = -1;
					P(k,k-1) = -1;
					P(k,k+i+1) = -1;
					P(k,k+i) = -1;
				end
			elseif (i == rows)
				P(k,k) = 5;
				P(k,k+1) = -1;
				P(k,k-1) = -1;
				P(k,k-i) = -1;
				P(k,k-i+1) = -1;
			else 
				P(k,k) = 6;
				P(k,k-1) = -1;
				P(k,k+1) = -1;
				P(k,k-i) = -1;
				P(k,k-i+1) = -1;
				P(k,k+i) = -1;
				P(k,k+i+1) = -1;
			end
		end
	end
A = P;
k;	
endfunction