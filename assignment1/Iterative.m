function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 


	G = dlmread(nume);
	[gm gn] = size(G);
	noduri = G(1,1);

	

	A = zeros(gm-3,gm-3);
 
	for i = 2:gm-2
		for j = 3:gn
			if (G(i,j) != 0)
				A(i-1,G(i,j)) = 1;
			end
		end
	end
	G;
	A;

	

	K = zeros(gm-3,gm-3);

	for i = 2:gm-2
		K(i-1,i-1) = G(i,2);
	end
	K;

	for i = 1:gm-3
		if (A(i,i) == 1)
			K(i,i)--;
		end
	end
	K;

	for i = 1:gm-3
		A(i,i) = 0;
	end
	A;

	M = (inv(K) * A)';
	%'


	R2 = zeros(noduri,1);
	for i = 1:noduri
		R2(i) = 1/noduri;
	end

	vector = ones(noduri,1);


	R2 = d * M * R2 + (1 -d)/noduri * vector;

	while (1)
		R = R2;
		R2 = d * M * R2 + (1 -d)/noduri * vector;
		R2;
		if (norm(R2 - R) < eps)
			break;
		end

	end

endfunction