function [Q R] = gs(T)

	[mt nt] = size(T);

	Q = zeros(mt, nt);
	R = zeros(nt, nt);

	for i = 1:nt
		Q(:,i) = T(:,i);
		for j = 1:i-1
			R(j,i) = Q(:,j)' * Q(:,i);%'
			Q(:,i) = Q(:,i) - R(j,i) * Q(:,j);
		end
		R(i,i) = norm(Q(:,i))';%'
		Q(:,i) = Q(:,i) / R(i,i);
	end
	Q;
	R;
endfunction