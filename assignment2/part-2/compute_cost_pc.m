function [cost] = compute_cost_pc(points, centroids)

[m n] = size(points);
[mc nc] = size(centroids);

	for q = 1:m
		j = 1;
		for o = 1:n
			for k = 1:mc
				D(q,k) = norm(points(q,:) - centroids(k,:));
				j = j + 3;
			end
		end
	end
D;
	for q = 1:m
		[e(q) r(q)] = min(D(q,:));
	end
e;
r;
	cost = sum(e)
endfunction